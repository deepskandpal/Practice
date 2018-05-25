#include<iostream>

using namespace std;

int main()
{
    int no;
    cout<<"enter any number (-1 for quitting):\n";
    cin>>no;
    if(no==-1)
    {
        cout<<"all done"<<endl;
        
    }
    else {
        cout<<"you entered:"<<no<<endl;
    }
    return 0;
}