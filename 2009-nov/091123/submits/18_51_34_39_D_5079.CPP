#include <iostream> // ����.�����
#include <fstream>
using namespace std; // ��������� ������������ ����
struct Ment
	{
	int post; //mas[0] - 1-�� ����� mas[1] - 2- ����� mas[2] - ����� ������
	};
///////////////////////////
int main() // ������� �������
	{
    int N,mesto; // �������� ����� N

	/********* ���� �� ����� ferrrari.in *******/
	ifstream infile("road.in");
	infile>>N;
	int i;
	Ment* M;
	M=new Ment[N];
	for(i=0;i<N;i++)
		infile>>M[i].post;
	infile>>mesto;
	/******************************************** ��������� ***/
	int Number;
	int Max=20002;
	for(i=0;i<N;i++)
		{
		if(abs(M[i].post-mesto)<abs(Max-mesto))
			{
			Max=M[i].post;
			Number=i;
			}
		}
    /********* ����� � ���� ferrrari.out *******/
	ofstream outfile("road.out");
	outfile<<(Number+1);
	cout<<"All operations done."<<endl;
	return 0;
} // ����� ������� �������
