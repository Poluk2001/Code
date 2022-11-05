#include <iostream>
int main(){
	int a = 2; //
	int *p1 = 0;
	int *p2 = 0;
	p1 = &a;
	p2 = &a;
	*p1 = 3;
	if(p1 == p2){
		std::cout << "True" << "\n";
		std::cout << p1 << " " << p2 << "\n";
		std::cout << *p1 << " " << *p2;
	}else{
		std::cout << "false";
	}
}