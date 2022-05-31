#include <iostream>
#include <string>


using namespace std;


string cipher_text();   //function prototypes
string originalText();
string generateKey();

//--------------------------------------------------------------------------------
/*Encryption
The plaintext(P) and key(K) are added modulo 26.
Ei = (Pi + Ki) mod 26

Decryption
Di = (Ei - Ki + 26) mod 26
*/


string generateKey(string phrase, string key)
{
    int x = phrase.size();
 
    for (int i = 0; ; i++)
    {
        if (x == i)
            i = 0;
        if (key.size() == phrase.size())
            break;
        key.push_back(key[i]);
    }
    return key;
}

//----------------------------------------------------------------------------------
//This function should return string encryption using key
 string cipherText(string phrase, string key)
{
    string cipher_text;
 
    for (int i = 0; i < phrase.size(); i++)
    {
        // converting in range 0-25
        char x = (phrase[i] + key[i]) %26;
 
        // convert into alphabets(ASCII)
        x += 'A';
 
        cipher_text.push_back(x);
    }
    return cipher_text;
}

//------------------------------------------------------------------------------------
// used for decryption
string originalText(string cipher_text, string key)
{
    string orig_text;
 
    for (int i = 0 ; i < cipher_text.size(); i++)
    {
        // converting in range 0-25
        char x = (cipher_text[i] - key[i] + 26) %26;
 
        // convert into alphabets(ASCII)
        x += 'A';
      
        orig_text.push_back(x);
    }
    return orig_text;
}
//-----------------------------------------------------------------------------------



int main() 
{
  //need prompts here to ask for user inputed string 
  // need prompts to ask for a user inputed keyword ALSO STRING
  string phrase;
  string keyword = "T"; //SET TO ONE LETTER BECAUSE PHRASE NEEDS TO BE BIGER THEN KEYWORD HAVING ONE LETTER ALLOWS FOR MORE PHRASES TO BE USED.
  cout << "Please enter a phrase in all caps and with no spaces that you would like to encrypt: ";
  cin >> phrase;

  string key = generateKey(phrase, keyword);
    string cipher_text = cipherText(phrase, key);
 
    cout << "Ciphertext : "
         << cipher_text << "\n";
 
    cout << "Original/Decrypted Text : "
         << originalText(cipher_text, key);
    return 0;
 
  
}
