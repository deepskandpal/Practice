#include<iostream>

using namespace std;
#define Week =7;

class Sal
{ 
 public:   
   int GetSales(int);
   void MethodOne();
   int MethodTwo(int);
   int MethodThree(int);
 };
 
 int Sal::GetSales(int sales)
 {  
    int  revenue ,sales;
    revenue=(sales*225);
    return revenue;
 }
 
  void Sal::MethodOne()
 {  
    int sales; 
    cout<<"enter sales :"<<endl;
    cin>>sales;
    cout<<"your salary is not depended on sales it is fixed at:"<<600<<endl;
 }
   
   int Sal::MethodTwo(int hours)
   { 
      int y, salary,shoes;
      y=GetSales(shoes);
      cout<<"enter number of hours"<<endl;
      cin>>hours;
      cout<<"revenue :"<<y<<endl;
      salary=((hours*7)+(y*0.1));
      cout<<"Your salary is :"<<salary<<endl;
    }
    
   int Sal::MethodThree(int shoes )
   {   int y,salary,shoes;
       cout<<"enter the number of shoes"<<endl;
       cin>>shoes;
       y=GetSales(shoes);
       salary=((0.2*y)+(20*shoes));
       cout<<"your salary is : "<<salary<<endl;
    }
    
    int main()
    {   
        Sal s;
        int shoes,hours;
        cout<<"Enter the number of hours done in the week:"<<endl;
        cin>>hours;
        cout<<"Enter the number of hours doneshoes sold in the week:"<<endl;
        cin>>shoes;
        s.GetSales(shoes);
        s.MethodOne();
        s.MethodTwo(hours);
        s.MethodThree(shoes);
        return 0;
        


        
        
    }
    