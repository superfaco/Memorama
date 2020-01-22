/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nent.mem.game;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import nent.base.BaseDao;
import nent.utils.Server;

/**
 *
 * @author C. Fernando Alfonso Caldera Olivas
 */
public class GameDao extends BaseDao<GameBean> {

    private static GameDao instance;

    public static final GameDao getInstance() {
        if (instance == null) {
            instance = new GameDao();
        }
        return instance;
    }

    @Override
    public final int save(GameBean bean) throws Exception {
        int status = 0;
        Connection conn = null;
        PreparedStatement ps = null;
        try {
            conn = Server.getInstance().getConnection();
            ps = (PreparedStatement) conn.prepareStatement(" insert into games(timeToSolve, gameDate, user) values(?, ?, ?)");
            ps.setBigDecimal(1, bean.getTimeToSolve());
            ps.setTimestamp(2, bean.getGameDate());
            ps.setInt(3, bean.getUser().getId());
            status = ps.executeUpdate();
        } catch (Exception e) {
            throw e;
        } finally {
            close(null, ps, conn);
        }
        return status;
    }

    @Override
    public final int update(GameBean bean) throws Exception {
        int status = 0;
        Connection conn = null;
        PreparedStatement ps = null;
        try {
            conn = Server.getInstance().getConnection();
            ps = (PreparedStatement) conn.prepareStatement(" update games set timeToSolve = ?, gameDate = ?, user = ? where id = ?");
            ps.setBigDecimal(1, bean.getTimeToSolve());
            ps.setTimestamp(2, bean.getGameDate());
            ps.setInt(3, bean.getUser().getId());
            ps.setInt(4, bean.getId());
            status = ps.executeUpdate();
        } catch (Exception e) {
            throw e;
        } finally {
            close(null, ps, conn);
        }
        return status;
    }

    @Override
    public final int delete(GameBean bean) throws Exception {
        int status = 0;
        Connection conn = null;
        PreparedStatement ps = null;
        try {
            conn = Server.getInstance().getConnection();
            ps = (PreparedStatement) conn.prepareStatement(" delete from games where id = ?");
            ps.setInt(1, bean.getId());
        } catch (Exception e) {
            throw e;
        } finally {
            close(null, ps, conn);
        }
        return status;
    }

    @Override
    public final List<GameBean> getAllRecords() throws Exception {
        List<GameBean> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = Server.getInstance().getConnection();
            ps = (PreparedStatement) conn.prepareStatement(
                    " select games.*, users.userName"
                    + " from games"
                    + " join users on games.user = users.id"
            );
            rs = ps.executeQuery();
            while (rs.next()) {
                GameBean g = new GameBean();
                g.setId(rs.getInt("games.id"));
                g.setTimeToSolve(rs.getBigDecimal("games.timeToSolve"));
                g.setGameDate(rs.getTimestamp("games.gameDate"));
                g.getUser().setId(rs.getInt("games.user"));
                g.getUser().setUserName(rs.getString("users.userName"));
                list.add(g);
            }
        } catch (Exception e) {
            throw e;
        } finally {
            close(rs, ps, conn);
        }
        return list;
    }

    @Override
    public final GameBean getRecordById(GameBean bean) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public final boolean recordExists(GameBean bean) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public final GameBean getRecord(GameBean bean) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public final List<GameBean> getRecords(GameBean bean) throws Exception {
        List<GameBean> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = Server.getInstance().getConnection();
            ps = (PreparedStatement) conn.prepareStatement(
                    " select games.*"
                    + " from games"
                    + " join users on games.user = users.id"
                    + " where games.user = ?"
            );
            ps.setInt(1, bean.getUser().getId());
            rs = ps.executeQuery();
            while (rs.next()) {
                GameBean g = new GameBean();
                g.setId(rs.getInt("games.id"));
                g.setTimeToSolve(rs.getBigDecimal("games.timeToSolve"));
                g.setGameDate(rs.getTimestamp("games.gameDate"));
                g.getUser().setId(rs.getInt("games.user"));
                list.add(g);
            }
        } catch (Exception e) {
            throw e;
        } finally {
            close(rs, ps, conn);
        }
        return list;
    }

}
