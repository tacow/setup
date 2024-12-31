// 编译： cl /EHsc /std:c++17 md5_calculator.cpp /Fe:md5_calculator.exe

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

// 计算文件的 MD5 哈希值
std::string CalculateMD5(const std::string &filename)
{
    std::ifstream file(filename, std::ios::binary);
    if (!file.is_open())
    {
        throw std::runtime_error("Could not open file: " + filename);
    }

    // 打开 MD5 算法提供者
    BCRYPT_ALG_HANDLE hAlg = NULL;
    if (BCryptOpenAlgorithmProvider(&hAlg, BCRYPT_MD5_ALGORITHM, NULL, 0) != 0)
    {
        throw std::runtime_error("BCryptOpenAlgorithmProvider failed");
    }

    // 创建哈希对象
    BCRYPT_HASH_HANDLE hHash = NULL;
    if (BCryptCreateHash(hAlg, &hHash, NULL, 0, NULL, 0, 0) != 0)
    {
        BCryptCloseAlgorithmProvider(hAlg, 0);
        throw std::runtime_error("BCryptCreateHash failed");
    }

    // 读取文件内容并更新哈希
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
    // 处理剩余的字节
    if (file.gcount() > 0)
    {
        if (BCryptHashData(hHash, (PUCHAR)buffer, (ULONG)file.gcount(), 0) != 0)
        {
            BCryptDestroyHash(hHash);
            BCryptCloseAlgorithmProvider(hAlg, 0);
            throw std::runtime_error("BCryptHashData failed");
        }
    }

    // 获取哈希值
    std::vector<BYTE> hash(16); // MD5 哈希值是 128 位（16 字节）
    if (BCryptFinishHash(hHash, hash.data(), (ULONG)hash.size(), 0) != 0)
    {
        BCryptDestroyHash(hHash);
        BCryptCloseAlgorithmProvider(hAlg, 0);
        throw std::runtime_error("BCryptFinishHash failed");
    }

    // 关闭哈希对象和算法提供者
    BCryptDestroyHash(hHash);
    BCryptCloseAlgorithmProvider(hAlg, 0);

    // 将哈希值转换为十六进制字符串
    std::stringstream ss;
    for (BYTE b : hash)
    {
        ss << std::hex << std::setw(2) << std::setfill('0') << (int)b;
    }

    return ss.str();
}

// 计算文件夹中所有文件的 MD5 哈希值
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
