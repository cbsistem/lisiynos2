#include <fstream.h>
#include <string.h>

int main(){
  ifstream in("y.in"); // ��������� ������� ����
  ofstream out("y.out"); // ��������� �������� ����
  char s[1000000]; // ������� ����� ��� ������
  in >> s; // ������ ������ �� �������� �����
  for(int i=0;i<strlen(s);i++) // ������� ����������� ������
    out << s[strlen(s)-i-1];
  in.close(); out.close(); // ��������� ������� � �������� �����
  return 0;
}
