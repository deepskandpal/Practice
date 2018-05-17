// Example program
#include <iostream>
#include <string>

using namespace std;

class Salary
{
    public:
    int estimate=1,noofshoes=0,WeeklySales=0;
    const int shoeprice=225;
    
    
    
    GetInput(){

        
        }
    
    CalcMethod1(int){
        WeeklySales=600+(shoeprice*noofshoes)
        cout<<"Method1 Sales:- "<<WeeklySales<<endl;
        }
        
    CalcMethod2(noofshoes){
        WeeklySales=(45*7*6)+((shoeprice*noofshoes)*0.1)
        cout<<"Method1 Sales:- "<<WeeklySales<<endl;
        }
    CalcMethod3(noofshoes){
        WeeklySales=(((shoeprice*noofshoes)*0.2)+noofshoes*20)
        cout<<"Method1 Sales:- "<<WeeklySales<<endl;
        }

    
    }

int main()
{
    int noofshoes=0,WeeklySales=0;
        
        cout<<"Enter number of shoes to estimate sale "<<endl;
        cin>>noofshoes>>endl;
        
    Salary s;
    s.CalcMethod1(noofshoes);
    s.CalcMethod2(noofshoes);
    s.CalcMethod3(noofshoes);
          
        }
}
}