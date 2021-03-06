#include <iostream>
#include <cstring>
#include "warden.h"
#include "pluginmanager.h"

#define PluginManager	PluginManager::Instance()

using namespace::std;

Warden *Warden::Instance()
{
	static Warden instance;

	return &instance;
}

string Warden::eval(string msg)
{
	string formatted = format_message(msg);

	return(parse_message(formatted));
}

string Warden::format_message(string msg)
{
	string::iterator it;

	for(it = msg.begin(); it != msg.end(); ++it)
	{

		if(*it == ' ')
		{
			if(*(it + 1) == ' ')
			{
				msg.erase(it);
				--it;
			}
		}
		else if(*it == ',')
		{
			if(*(it - 1) == ' ')
			{
				msg.erase(it - 1);
				it-=2;
			}
			else if(*(it + 1) == ' ')
			{
				msg.erase(it + 1);
				it-=2;
			}
		}

	}

	return msg;

}

string Warden::parse_message(string message)
{

	string msg = message;
	transform( msg.begin(), msg.end(), msg.begin(), ptr_fun(::toupper) );

	size_t cmd_div = msg.find(" ");
	string keyword =  msg.substr(0, cmd_div);
	string arguments = message.substr(cmd_div + 1);


	if(keyword == "LOAD")
	{

		//cout << "LOAD was recieved" << endl;
		return(PluginManager->load(arguments));

	}
	else if(keyword == "UNLOAD")
	{

		//cout << "UNLOAD was recieved" << endl;
		return(PluginManager->unload(arguments));

	}
	else if(keyword == "RELOAD")
	{

		//cout << "RELOAD was recieved" << endl;
		//return("RELOAD successful");
		return(PluginManager->reload(arguments));

	}
	else if(keyword == "HELP")
	{

		//cout << "HELP was recieved" << endl;
		return("HERRO HELP");

	}
	else if(keyword == "QUIT" || keyword == "EXIT" )
	{

		//cout << "QUIT was recieved" << endl;
		//return("QUITTER!");
		exit(0);

	}

	return(PluginManager->execute(msg));

}

string Warden::load(string filename)
{
	return PluginManager->load(filename);
}

string Warden::unload(string filename)
{
	return PluginManager->unload(filename);
}

string Warden::reload(string filename)
{
	return PluginManager->reload(filename);
}

string Warden::help(string filename)
{
	return("HELP!!");
// return PluginManager->reload(filename);
}

void Warden::quit()
{
	exit(0);
}

Warden::~Warden()
{

}
