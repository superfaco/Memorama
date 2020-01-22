/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nent.mem.user;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import nent.base.BaseDao;
import nent.utils.Encrypter;
import nent.utils.Server;

/**
 *
 * @author facoj
 */
public final class UserDao extends BaseDao<UserBean> {

    private static UserDao instance;

    private UserDao() {
    }

    public static final UserDao getInstance() {
        if (instance == null) {
            instance = new UserDao();
        }
        return instance;
    }

    @Override
    public final int save(UserBean bean) throws Exception {
        int status = 0;
        Connection conn = null;
        PreparedStatement ps = null;
        try {
            conn = Server.getInstance().getConnection();
            ps = (PreparedStatement) conn.prepareStatement(" insert into users(userName, pass) values(?, ?)");
            ps.setString(1, bean.getUserName());
            ps.setString(2, Encrypter.encrypt(bean.getPass()));
            status = ps.executeUpdate();
        } catch (Exception e) {
            throw e;
        } finally {
            close(null, ps, conn);
        }

        return status;
    }

    @Override
    public final int update(UserBean bean) throws Exception {
        int status = 0;
        Connection conn = null;
        PreparedStatement ps = null;
        try {
            conn = Server.getInstance().getConnection();
            ps = (PreparedStatement) conn.prepareStatement(" update users set userName = ?, pass = ? where id = ?");
            ps.setString(1, bean.getUserName());
            ps.setString(2, bean.getPass());
            ps.setInt(3, bean.getId());
            status = ps.executeUpdate();
        } catch (Exception e) {
            throw e;
        } finally {
            close(null, ps, conn);
        }
        return status;
    }

    @Override
    public final int delete(UserBean bean) throws Exception {
        int status = 0;
        Connection conn = null;
        PreparedStatement ps = null;
        try {
            conn = Server.getInstance().getConnection();
            ps = (PreparedStatement) conn.prepareStatement(" delete from users where id = ?");
            ps.setInt(1, bean.getId());
            status = ps.executeUpdate();
        } catch (Exception e) {
            throw e;
        } finally {
            close(null, ps, conn);
        }
        return status;
    }

    @Override
    public final List<UserBean> getAllRecords() throws Exception {
        List<UserBean> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = Server.getInstance().getConnection();
            ps = (PreparedStatement) conn.prepareStatement(" select * from users");
            rs = ps.executeQuery();
            while (rs.next()) {
                UserBean u = new UserBean();
                u.setId(rs.getInt("id"));
                u.setUserName(rs.getString("userName"));
                u.setPass(rs.getString("pass"));
                list.add(u);
            }
        } catch (Exception e) {
            throw e;
        } finally {
            close(rs, ps, conn);
        }
        return list;
    }

    @Override
    public final UserBean getRecordById(UserBean bean) throws Exception {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        UserBean u = new UserBean();
        try {
            conn = Server.getInstance().getConnection();
            ps = (PreparedStatement) conn.prepareStatement(" select * from users where id = ?");
            ps.setInt(1, bean.getId());
            rs = ps.executeQuery();
            if (rs.next()) {
                u.setId(rs.getInt("id"));
                u.setUserName(rs.getString("userName"));
                u.setPass(rs.getString("pass"));
            }
        } catch (Exception e) {
            throw e;
        } finally {
            close(rs, ps, conn);
        }
        return u;
    }

    @Override
    public final boolean recordExists(UserBean bean) throws Exception {
        boolean exists = false;
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = Server.getInstance().getConnection();
            ps = (PreparedStatement) conn.prepareStatement(" select count(*) from users where userName = ? and pass = ?");
            ps.setString(1, bean.getUserName());
            ps.setString(2, bean.getPass());
            rs = ps.executeQuery();
            if (rs.next()) {
                exists = rs.getInt(1) > 0;
            }
        } catch (Exception e) {
            throw e;
        } finally {
            close(rs, ps, conn);
        }
        return exists;
    }

    @Override
    public final UserBean getRecord(UserBean bean) throws Exception {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        UserBean u = new UserBean();
        try {
            conn = Server.getInstance().getConnection();
            ps = (PreparedStatement) conn.prepareStatement(" select * from users where userName = ? and pass = ?");
            ps.setString(1, bean.getUserName());
            ps.setString(2, bean.getPass());
            rs = ps.executeQuery();
            if (rs.next()) {
                u.setId(rs.getInt("id"));
                u.setUserName(rs.getString("userName"));
                u.setPass(rs.getString("pass"));
            }
        } catch (Exception e) {
            throw e;
        } finally {
            close(rs, ps, conn);
        }
        return u;
    }

    @Override
    public final List<UserBean> getRecords(UserBean bean) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
