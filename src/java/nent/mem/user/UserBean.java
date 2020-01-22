/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nent.mem.user;

import nent.base.BaseBean;

/**
 *
 * @author facoj
 */
public class UserBean extends BaseBean {

    private Integer id;
    private String userName;
    private String pass;

    public UserBean() {
    }

    public UserBean(Integer id, String userName, String pass) {
        this.id = id;
        this.userName = userName;
        this.pass = pass;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

}
