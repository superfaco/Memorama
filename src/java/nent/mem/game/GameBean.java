/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nent.mem.game;

import java.math.BigDecimal;
import java.sql.Timestamp;
import nent.base.BaseBean;
import nent.mem.user.UserBean;

/**
 *
 * @author C. Fernando Alfonso Caldera Olivas
 */
public class GameBean extends BaseBean {

    private Integer id;
    private BigDecimal timeToSolve;
    private Timestamp gameDate;
    private UserBean user;

    public GameBean() {
    }

    public GameBean(Integer id, BigDecimal timeToSolve, Timestamp gameDate, UserBean user) {
        this.id = id;
        this.timeToSolve = timeToSolve;
        this.gameDate = gameDate;
        this.user = user;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public BigDecimal getTimeToSolve() {
        return timeToSolve;
    }

    public void setTimeToSolve(BigDecimal timeToSolve) {
        this.timeToSolve = timeToSolve;
    }

    public Timestamp getGameDate() {
        return gameDate;
    }

    public void setGameDate(Timestamp gameDate) {
        this.gameDate = gameDate;
    }

    public UserBean getUser() {
        if (user == null) {
            user = new UserBean();
        }
        return user;
    }

    public void setUser(UserBean user) {
        this.user = user;
    }

}
