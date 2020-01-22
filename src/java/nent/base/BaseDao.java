/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nent.base;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

/**
 *
 * @author facoj
 * @param <T>
 */
public abstract class BaseDao<T extends BaseBean> {

    public abstract int save(T bean) throws Exception;

    public abstract int update(T bean) throws Exception;

    public abstract int delete(T bean) throws Exception;

    public abstract List<T> getAllRecords() throws Exception;

    public abstract T getRecordById(T bean) throws Exception;

    public abstract boolean recordExists(T bean) throws Exception;

    public abstract T getRecord(T bean) throws Exception;

    public abstract List<T> getRecords(T bean) throws Exception;

    protected static final void close(ResultSet rs, PreparedStatement ps, Connection conn) throws SQLException {
        if (rs != null && !rs.isClosed()) {
            rs.close();
        }

        if (ps != null && !ps.isClosed()) {
            ps.close();
        }

        if (conn != null && !conn.isClosed()) {
            conn.close();
        }
    }

    @Override
    public final Object clone() throws CloneNotSupportedException {
        super.clone(); //To change body of generated methods, choose Tools | Templates.
        throw new CloneNotSupportedException();
    }

}
