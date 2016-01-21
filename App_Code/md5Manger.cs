using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Security.Cryptography;
using System.Collections.Generic;
using System.IO;
using System.Text; 
/// <summary>
/// md5Manger 的摘要说明
/// </summary>
public class md5Manger
{
	public md5Manger()
	{
    }
		//
		// TODO: 在此处添加构造函数逻辑


        #region MD5加密                   
        /// <summary>   
        /// MD5加密   
        /// </summary>   
        /// <param name="strSource">需要加密的字符串</param>   
        /// <returns>MD5加密后的字符串</returns>   
        public string Md5Encrypt(string strSource)   
        {   
            //把字符串放到byte数组中   
            byte[] bytIn = System.Text.Encoding.Default.GetBytes(strSource);   
            //建立加密对象的密钥和偏移量           
            byte[] iv = { 103, 16, 93, 156, 78, 4, 218, 32 };//定义偏移量   
            byte[] key = { 55, 103, 246, 79, 36, 99, 167, 3 };//定义密钥   
            //实例DES加密类   
            DESCryptoServiceProvider mobjCryptoService = new DESCryptoServiceProvider();   
            mobjCryptoService.Key = iv;   
            mobjCryptoService.IV = key;   
            ICryptoTransform encrypto = mobjCryptoService.CreateEncryptor();   
            //实例MemoryStream流加密密文件   
            System.IO.MemoryStream ms = new System.IO.MemoryStream();   
            CryptoStream cs = new CryptoStream(ms, encrypto, CryptoStreamMode.Write);   
            cs.Write(bytIn, 0, bytIn.Length);   
            cs.FlushFinalBlock();   
            return System.Convert.ToBase64String(ms.ToArray());   
        }  
        #endregion  
 
        #region MD5解密                  
        /// <summary>   
        /// MD5解密   
        /// </summary>   
        /// <param name="Source">需要解密的字符串</param>   
        /// <returns>MD5解密后的字符串</returns>   
        public string Md5Decrypt(string Source)   
        {   
            //将解密字符串转换成字节数组   
            byte[] bytIn = System.Convert.FromBase64String(Source);   
            //给出解密的密钥和偏移量，密钥和偏移量必须与加密时的密钥和偏移量相同   
            byte[] iv = { 103, 16, 93, 156, 78, 4, 218, 32 };//定义偏移量   
            byte[] key = { 55, 103, 246, 79, 36, 99, 167, 3 };//定义密钥   
            DESCryptoServiceProvider mobjCryptoService = new DESCryptoServiceProvider();   
            mobjCryptoService.Key = iv;   
            mobjCryptoService.IV = key;   
            //实例流进行解密   
            System.IO.MemoryStream ms = new System.IO.MemoryStream(bytIn, 0, bytIn.Length);   
            ICryptoTransform encrypto = mobjCryptoService.CreateDecryptor();   
            CryptoStream cs = new CryptoStream(ms, encrypto, CryptoStreamMode.Read);   
            StreamReader strd = new StreamReader(cs, Encoding.Default);   
            return strd.ReadToEnd();   
        }  
        #endregion   

		//

}
