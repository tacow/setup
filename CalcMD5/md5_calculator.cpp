// ���룺 cl /EHsc /std:c++17 md5_calculator.cpp /Fe:md5_calculator.exe

#include <windows.h>
#include <bcrypt.h>
#include <iostream>
#include <fstream>
#include <sstream>
#include <iomanip>
#include <vector>
#include <filesystem>
#include <string>

namespace fs = std::filesystem;

#pragma comment(lib, "bcrypt.lib")

// �����ļ��� MD5 ��ϣֵ
std::string CalculateMD5(const std::string &filename)
{
    std::ifstream file(filename, std::ios::binary);
    if (!file.is_open())
    {
        throw std::runtime_error("Could not open file: " + filename);
    }

    // �� MD5 �㷨�ṩ��
    BCRYPT_ALG_HANDLE hAlg = NULL;
    if (BCryptOpenAlgorithmProvider(&hAlg, BCRYPT_MD5_ALGORITHM, NULL, 0) != 0)
    {
        throw std::runtime_error("BCryptOpenAlgorithmProvider failed");
    }

    // ������ϣ����
    BCRYPT_HASH_HANDLE hHash = NULL;
    if (BCryptCreateHash(hAlg, &hHash, NULL, 0, NULL, 0, 0) != 0)
    {
        BCryptCloseAlgorithmProvider(hAlg, 0);
        throw std::runtime_error("BCryptCreateHash failed");
    }

    // ��ȡ�ļ����ݲ����¹�ϣ
    char buffer[4096];
    while (file.read(buffer, sizeof(buffer)))
    {
        if (BCryptHashData(hHash, (PUCHAR)buffer, sizeof(buffer), 0) != 0)
        {
            BCryptDestroyHash(hHash);
            BCryptCloseAlgorithmProvider(hAlg, 0);
            throw std::runtime_error("BCryptHashData failed");
        }
    }
    // ����ʣ����ֽ�
    if (file.gcount() > 0)
    {
        if (BCryptHashData(hHash, (PUCHAR)buffer, (ULONG)file.gcount(), 0) != 0)
        {
            BCryptDestroyHash(hHash);
            BCryptCloseAlgorithmProvider(hAlg, 0);
            throw std::runtime_error("BCryptHashData failed");
        }
    }

    // ��ȡ��ϣֵ
    std::vector<BYTE> hash(16); // MD5 ��ϣֵ�� 128 λ��16 �ֽڣ�
    if (BCryptFinishHash(hHash, hash.data(), (ULONG)hash.size(), 0) != 0)
    {
        BCryptDestroyHash(hHash);
        BCryptCloseAlgorithmProvider(hAlg, 0);
        throw std::runtime_error("BCryptFinishHash failed");
    }

    // �رչ�ϣ������㷨�ṩ��
    BCryptDestroyHash(hHash);
    BCryptCloseAlgorithmProvider(hAlg, 0);

    // ����ϣֵת��Ϊʮ�������ַ���
    std::stringstream ss;
    for (BYTE b : hash)
    {
        ss << std::hex << std::setw(2) << std::setfill('0') << (int)b;
    }

    return ss.str();
}

// �����ļ����������ļ��� MD5 ��ϣֵ
void CalculateFolderMD5(const std::string &folderPath, const std::string &basePath)
{
    for (const auto &entry : fs::directory_iterator(folderPath))
    {
        if (fs::is_regular_file(entry.path()))
        {
            try
            {
                std::string md5 = CalculateMD5(entry.path().string());
                std::string relativePath = fs::relative(entry.path(), basePath).string();
                std::cout << md5 << "  " << relativePath << std::endl;
            }
            catch (const std::exception &e)
            {
                std::cerr << "Error calculating MD5 for " << entry.path().string() << ": " << e.what() << std::endl;
            }
        }
        else if (fs::is_directory(entry.path()))
        {
            CalculateFolderMD5(entry.path().string(), basePath);
        }
    }
}

int main(int argc, char *argv[])
{
    if (argc != 2)
    {
        std::cerr << "Usage: " << argv[0] << " <file_or_folder_path>" << std::endl;
        return 1;
    }

    std::string path = argv[1];

    try
    {
        if (fs::is_regular_file(path))
        {
            std::string filename = fs::path(path).filename().string();
            std::string md5 = CalculateMD5(path);
            std::cout << md5 << "  " << filename << std::endl;
        }
        else if (fs::is_directory(path))
        {
            CalculateFolderMD5(path, path);
        }
        else
        {
            std::cerr << "The provided path is neither a file nor a directory: " << path << std::endl;
            return 1;
        }
    }
    catch (const std::exception &e)
    {
        std::cerr << "Error: " << e.what() << std::endl;
        return 1;
    }

    std::cout << "Press Enter to exit...";
    std::cin.get();
    return 0;
}
