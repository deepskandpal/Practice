#include <ctime>
#include <iostream>
using namespace std;

int main()
{
int sysTime = time(0);
int sysTimeMS = sysTime*1000;

int random;
random=sysTimeMS%99;
cout << "System Time in milliseconds is " << sysTimeMS << "." << endl;
//cout<<"Random number is "<<random<<endl;


int guess;

do {
   
   cout<<"Guess the random number "<<endl;
   cin>>guess;
   
   if(guess<random){
      cout<<"Enter larger number"<<endl;
      }
   
   else if(guess>random)
   {
       cout<<"Enter smaller number"<<endl;
       }
       
    else if(guess==random)
    {
        cout<<"Match found!"<<endl;
        }
   
   
} 
while(random!=guess);


}