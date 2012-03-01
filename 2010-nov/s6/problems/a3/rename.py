# -*- coding: windows-1251 -*-
import os.path

# �������������� ������
# ������ �������� ������ � �������
# ������ �� ������, ������ "%02d" ��� ������� � "%02d.a" ��� ��������
# start - ����� ������� ����� �� ���� �������
def tests_rename(pattern_from,pattern_to,start=1):
  test = 1
  OldName = pattern_from % test   # ����������� ����� �����
  while os.path.isfile(OldName):
    NewName = pattern_to % (test-1+start)
    print OldName + ' -> ' + NewName
    os.rename(OldName, NewName)
    test += 1
    OldName = pattern_from % test
  
tests_rename("INPUT%02d.TXT","%02d",2)
tests_rename("ANSWER%02d.TXT","%02d.a",2)