
<table id="dept_table" class="table table-striped">
    <thead>
        <tr>
            <th>SL No</th>
            <th>DEPT NAME</th>
        </tr>
    </thead>
    <tbody>
        <%

            String sql = "select initcap(DEPT_NAME) as DEPT_NAME,DEPT_ID from generic_dept where STATUS=? ";
            java.sql.PreparedStatement stmt = null;
            vicclass.User u = (vicclass.User) request.getSession().getAttribute("user");
            java.sql.Connection con = null;
            con = u.getConnection();
            java.sql.ResultSet rs = null;
            int i = 1;
            try {
                stmt = con.prepareStatement(sql);
                stmt.setString(1, "A");
                rs = stmt.executeQuery();
                while (rs.next()) {

        %>
        <tr>
            <td><%=i++%></td>
            <td><%=rs.getString("DEPT_NAME")%></td>
        </tr>
        <%
                }
            } catch (Exception e) {
                System.out.println(e.getMessage());
            } finally {
                try {
                    if (stmt != null) {
                        stmt.close();
                    }
                    if (rs != null) {
                        rs.close();
                    }
                } catch (Exception e) {
                    System.out.println(e.getMessage());
                }
            }
        %>
    <tbody>
</table>
