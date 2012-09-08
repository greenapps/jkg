/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.allin1.beans;

import java.io.Serializable;

/**
 *
 * @author Anshujkumar
 */
public class RolesBean implements Serializable {

    private String roleId;
    private String roleName;
    private String userName;

    /**
     * @return the roleId
     */
    public String getRoleId() {
        return roleId;
    }

    /**
     * @param roleId the roleId to set
     */
    public void setRoleId(String roleId) {
        this.roleId = roleId;
    }

    /**
     * @return the roleName
     */
    public String getRoleName() {
        return roleName;
    }

    /**
     * @param roleName the roleName to set
     */
    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

    /**
     * @return the userName
     */
    public String getUserName() {
        return userName;
    }

    /**
     * @param userName the userName to set
     */
    public void setUserName(String userName) {
        this.userName = userName;
    }
}
