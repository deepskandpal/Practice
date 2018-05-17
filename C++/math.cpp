#include<iostream>
using namespace std;

int main()
{
    int h , r ,p;
     for (h=1;h<10;h++)
    {
        for (p=1;p<33;p++)
        {
            for (r=1;r<200;r++)
            {
                if( ((10*h+3*p+0.5*r)==100) && (h+p+r)==100)
                  cout<<"Horses :"<<h<<"Pigs :"<<p<<"Rabbits :"<<r<<endl;
             }
        }
    }
    return 0;
}