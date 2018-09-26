/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.universal.db;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection implements DBProperties {

    private DBConnection() {

    }
    static Connection conn;

    public static Connection getConnection() {
        try {
            Class.forName(DRIVER);
            if (conn == null) {
                conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return conn;
    }

}
