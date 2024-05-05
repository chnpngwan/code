//密钥
let key = "N8MfABInvGh093KLuDsPO0YEtFWXNmU9"


// 加密数据
function encryptData(data) {
    const keyBytes = CryptoJS.enc.Utf8.parse(key);
    const encryptedBytes = CryptoJS.AES.encrypt(data, keyBytes, {
        mode: CryptoJS.mode.ECB,
        padding: CryptoJS.pad.Pkcs7
    });
    const encryptedData = encryptedBytes.toString();
    return encryptedData;
}

// 解密数据
function decryptData(encryptedData) {
    const encryptedBytes = CryptoJS.enc.Base64.parse(encryptedData);
    const keyBytes = CryptoJS.enc.Utf8.parse(key);

    const decryptedBytes = CryptoJS.AES.decrypt(
        {
            ciphertext: encryptedBytes
        },
        keyBytes,
        {
            mode: CryptoJS.mode.ECB,
            padding: CryptoJS.pad.Pkcs7
        }
    );

    const decryptedData = decryptedBytes.toString(CryptoJS.enc.Utf8);
    return decryptedData;
}