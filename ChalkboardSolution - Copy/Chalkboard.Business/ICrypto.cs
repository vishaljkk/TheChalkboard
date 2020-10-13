using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Chalkboard.Business
{
    public interface ICrypto
    {
        string Decrypt(string cipherString, bool useHashing);
        string Encrypt(string toEncrypt, bool useHashing);
    }
}
