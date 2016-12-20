/*
 * DBtest.cpp
 * Accessing a Postgresql DB from within C++
 *  2016 / Örjan Sterner
 *  David Hegardt
 */

#include <iostream>
#include <string>
#include <sstream> // ostringstream
#include <iomanip>
#include <vector>
#include <clocale>  // setlocale
#include <cctype>  // toupper
#include "DBhandler.h"
#include "winutf8.h"
#include "libpq-fe.h"
#include "terminal.h"
#include "PWinput.h"

using std::string;
using std::ostringstream;
using std::toupper;
using std::cerr;
using std::cout;
using std::cin;
using std::endl;
using std::setw;
using std::left;

int main(int argc, char **argv)
{
	Terminal term;  // To manipulate colors
	std::setlocale(LC_ALL, "Swedish_Sweden.1252");  // To show swedish characters in windows console
	term.pushColor(TerminalColor(COLOR::CYAN, COLOR::BLACK));
	cout << "************* Postgresql C/C++ interface demo *************\n\n";
	term.popColor();
	string duckinfo;
	std::vector<string> split;

	cout << "Enter firstname and email for the duck!" << endl;
	getline(cin,duckinfo);
	std::istringstream ss(duckinfo);
	string duckpass;
	string tmpString;
	char DELIM = ' ';

	// push back input string and store in vector, vector[0] = username vector[1] = email
	while (std::getline(ss, tmpString, DELIM)) {
		split.push_back(tmpString);
	}
	
	cout << "Enter password:" << endl;
	duckpass = getPassword(); // returns password and encrypts output string
	cout << endl;
	

	const string PG_PASSWORD { duckpass };	// Set password to input password
	ostringstream oss;  // string stream to concatenate strings
	string utf8QueryStr; // string converted to UTF8

	// Build string with connection info, Donald is added as user for the DB
	oss << "user=" << split[0] << " password=" << PG_PASSWORD << " dbname=postgres hostaddr=127.0.0.1 port=5432";
	
	win1252utf8(oss.str(), utf8QueryStr);  // Convert to UTF8, result in utf8QueryStr

	DBhandler db { utf8QueryStr }; // Create our database handler object

	/* Make a connection to the database */
	bool opResult = db.connectDB();

	// Check if email matches and set opResult to false if not 
	if (split[1] != "d.duck@quacksville.net") {
		opResult = !opResult;
	}
	if (!opResult) {
		term.pushColor(TerminalColor(COLOR::RED, COLOR::BLACK));
		cerr << "Wrong creditials, you are not logged in to postgres. Exiting." << endl;
		term.clearColors();
		return 1;
	}
	term.pushColor(TerminalColor(COLOR::GREEN, COLOR::BLACK));
	cout << split[0] << " is now logged in " << endl;
	cout << "Connected to Postgres DB on localhost\n\n";
	
	/*---------------------------------------------------------------------------------------*/
	
	// Let's show all persons
	
	oss.str("");  // Reset the stream and make it empty
	//oss << "SELECT förnamn, efternamn, gatuadress, postnr, epost FROM sportsclub.person;";
	oss << "SELECT förnamn, efternamn, gatuadress, person.postnr, postort, epost FROM";
	oss << " sportsclub8.person, sportsclub8.postort WHERE person.postnr = postort.postnr;";

	win1252utf8(oss.str(), utf8QueryStr); // convert to utf8
	
	
	// Start transaction
	if (!db.beginTransaction()) {
		cerr << "beginTransaction failed" << endl;
		db.closeDBconn();
		return 1;
	}
	
	// Make the query
	PGresult* qResult = db.makeQuery(utf8QueryStr.c_str());
	if (!qResult) // Failure
		return 1;

	// OK, let's get the field names, first get the number of fields
	int nFields = PQnfields(qResult);

	// Prepare the header with employee table field name
	cout << "\nAll persons in Sportsclub8:" << endl;
	term.pushColor(TerminalColor(COLOR::YELLOW, COLOR::BLACK));
	cout << "\n******************************************************************************************************\n";
	for (int i = 0; i < nFields; i++) {
		string fieldStr;
		utf8win1252(PQfname(qResult, i), fieldStr); // convert from utf8
		fieldStr[0] = std::toupper(fieldStr[0]);
		cout << left << setw(10)<< fieldStr << "\t";
	}
	cout << endl;

	// Next, print out the record for each row
	for (int i = 0; i < PQntuples(qResult); i++)
	{
		term.pushColor(TerminalColor(COLOR::WHITE, COLOR::BLACK));
		for (int j = 0; j < nFields; j++) {
			string valueStr; // utf8 convertered to Windows cp 1252
			utf8win1252(PQgetvalue(qResult, i, j), valueStr);
			cout << left << setw(10) << valueStr << "\t";
		}
		cout << endl;
		term.popColor();
	}

	cout << "\n******************************************************************************************************\n";
	term.clearColors();
	PQclear(qResult);

	db.endTransaction();

	/* close the connection to the database and cleanup */
	db.closeDBconn();

	return 0;
}
