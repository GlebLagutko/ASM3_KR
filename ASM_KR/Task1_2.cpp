#include <vector>
#include <iostream>
#include <ctime>
#include <iomanip>



extern "C"
{

	void __cdecl FindNOK(int y,int* x );
	void __cdecl ShiftMatrix(int*  b, int* c,int** x);
}



int main(int argc, char* argv[])
{
	//Program().Run();

	//Task1
	int a_size;
	int result;
	std::wcin >> a_size;
	srand(time(NULL));
	int* arr = new int[a_size];
	for (int i = 0; i < a_size; i++)
	{
		arr[i] = rand() % 20 + 1;
	}

	for (int i = 0; i < a_size; i++)
	{
		std::wcout << arr[i] << std::endl;
	}

	std::wcout << std::endl;;
	__asm
	{
		push arr
		push a_size
		call FindNOK
		mov result, eax
	}

	std::wcout << L"NOK : " << result << std::endl;

	std::wcout << std::endl;
	//Task2
	int N, M, K;
	std::wcout << L"Input N and M , and K < M: ";
	std::wcin >> N >> M >> K;

	int** matrix = new int*[N];
	int* b = new int[M];
	int* c = new int[3];
	c[0] = N;
	c[1] = M;
	c[2] = K;

	for (int i = 0; i < N; i++)
	{
		matrix[i] = new int[M];
		for (int j = 0; j < M; j++)
		{
			matrix[i][j] = rand() % 100;
			b[j] = 0;
		}
	}

	for (int i = 0; i < N; i++)
	{
		for (int j = 0; j < M; j++)
		{
			std::wcout << std::setw(6) << matrix[i][j] << ' ';
		}
		std::wcout << std::endl;
	}

	__asm
	{
		push matrix
		push c
		push b
		call ShiftMatrix
	}

	std::wcout << L"After : " << std::endl;

	for (int i = 0; i < N; i++)
	{
		for (int j = 0; j < M; j++)
		{
			std::wcout << std::setw(6) << matrix[i][j] << ' ';
		}
		std::wcout << std::endl;
	}
	std::wcout << L"Press any key to continue...";
	std::wcin.get();
	system("pause");
	return 0;
 }

