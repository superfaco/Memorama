/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nent.utils;

/**
 *
 * @author C. Fernando Alfonso Caldera Olivas
 */
public final class Encrypter {

    private Encrypter() {
    }

    public static final String encrypt(String inputString) {
        String encryptedString = "";
        for (int i = 0, j = inputString.length() - 1; i < inputString.length() / 2; i++, j--) {
            encryptedString += (char) (inputString.charAt(i) ^ Character.MAX_VALUE);
            encryptedString += (char) (inputString.charAt(j) ^ 0);
        }
        return encryptedString;
    }

    public static final String decrypt(String encryptedString) {
        String decryptedString;
        String left = "", right = "";
        for (int i = 0; i < encryptedString.length() - 1; i++) {
            left += (char) (encryptedString.charAt(i) ^ Character.MAX_VALUE);
            right = (char) (encryptedString.charAt(i + 1) ^ 0) + right;
        }
        decryptedString = left + right;
        return decryptedString;
    }

}
