/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package daoservice;

import configuration.DBConfig;
import com.allin1.beans.ArticleInBean;
import com.allin1.beans.QuotationDetailsBean;
import com.allin1.beans.RolesBean;
import com.allin1.beans.generalBean;
//import com.mysql.jdbc.PreparedStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.sql.Date;
import java.util.Enumeration;
import java.util.Hashtable;
import java.util.Vector;

/**
 *
 * @author Anshujkumar
 */
public class extendedDao {

    private static final String userid = DBConfig.dbUserName;
    private static final String password = DBConfig.dbPassword;
    private static final String url = DBConfig.dbUrl;

    public ArrayList getArticleInfo(String articleId) throws Exception {
        ResultSet rs = null, rs1 = null;
        ArrayList articleDetail = new ArrayList();
        System.out.println("ARTICLE ID IS====" + articleId);
        System.out.println("in ExtendedDAOORa getArticleInfo===");
        String qry = "";
        Connection conn = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            System.out.println("ANUJ CHECK2");
            conn = DriverManager.getConnection(url, userid, password);
            System.out.println("ANUJ CHECK3");
            if (!conn.isClosed()) {
                //String outletType = generalDAO.getOutletType(outlet_id);
                Statement st = conn.createStatement();
                qry = " select a.article_code,a.article_desc,b.ArticleTechDesc,a.article_price,a.article_currency from inv_article_m a,sal_quotationdetails_t b where a.article_code = '" + articleId + "' and b.articleId = '" + articleId + "' order by a.article_id ";
                System.out.println("Query for ArticleSet" + qry);
                rs = st.executeQuery(qry);
                System.out.println("Query111" + qry);
                if (rs != null && rs.isBeforeFirst()) {
                    while (rs.next()) {
                        ArticleInBean articleBean = new ArticleInBean();
                        articleBean.setArticleId(rs.getString(1));
                        articleBean.setArticleDesc(rs.getString(2));
                        articleBean.setArticleTechDesc(rs.getString(3).replace("<AnujTestingJKG>", "\n"));
                        articleBean.setPrice(rs.getString(4));
                        articleBean.setCurrency(rs.getString(5));
                        //rs1 = sh.executeQuery("select PERCENTAGE from GEN_PRODUCTTAXDETAILS_M WHERE OUTLET_ID=" + outlet_id + " AND STATUS='A' AND ARTICLE_ID='" + article + "'");
                        articleDetail.add(articleBean);
                    }

                } else {
                    for (int g = 0; g < 1; g++) {
                        ArticleInBean articleBean = new ArticleInBean();
                        articleBean.setArticleId(articleId);
                        articleBean.setArticleDesc("-");
                        articleBean.setArticleTechDesc("-");
                        articleBean.setPrice("-");
                        articleBean.setCurrency("-");
                        //rs1 = sh.executeQuery("select PERCENTAGE from GEN_PRODUCTTAXDETAILS_M WHERE OUTLET_ID=" + outlet_id + " AND STATUS='A' AND ARTICLE_ID='" + article + "'");
                        articleDetail.add(articleBean);
                    }
                }
            }
        } catch (Exception e) {
            System.out.println("EXCEPTION IN GET article INFO :" + e.getMessage());
        } finally {
            if (rs != null) {
                rs.close();
            }
        }
        System.out.println("No. Of Articles Returned Are:" + articleDetail.size());
        return articleDetail;
    }

    public ArrayList getArticleSpecInfo(String articleId) throws Exception {
        ResultSet rs = null, rs1 = null;
        ArrayList articleDetail = new ArrayList();
        System.out.println("ARTICLE ID IS====" + articleId);
        System.out.println("in ExtendedDAOORa getArticleInfo===");
        String qry = "";
        Connection conn = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            System.out.println("ANUJ CHECK2");
            conn = DriverManager.getConnection(url, userid, password);
            System.out.println("ANUJ CHECK3");
            if (!conn.isClosed()) {
                //String outletType = generalDAO.getOutletType(outlet_id);
                Statement st = conn.createStatement();

                qry = " SELECT articleSpec,article_spec FROM sal_quotationarticlespec_t WHERE articleId = '" + articleId + "' ";
                System.out.println("Query for ArticleSPEC" + qry);
                rs = st.executeQuery(qry);
                System.out.println("Query111" + qry);
                if (rs != null && rs.isBeforeFirst()) {
                    while (rs.next()) {
                        ArticleInBean articleBean = new ArticleInBean();
                        articleBean.setArticleTechSpec(rs.getString(1));
                        articleBean.setArticle_Spec(rs.getString(2));
                        //rs1 = sh.executeQuery("select PERCENTAGE from GEN_PRODUCTTAXDETAILS_M WHERE OUTLET_ID=" + outlet_id + " AND STATUS='A' AND ARTICLE_ID='" + article + "'");
                        articleDetail.add(articleBean);
                    }

                } else {
                    for (int g = 0; g < 5; g++) {
                        ArticleInBean articleBean = new ArticleInBean();
                        articleBean.setArticleTechSpec(" ");
                        articleBean.setArticle_Spec(" ");
                        //rs1 = sh.executeQuery("select PERCENTAGE from GEN_PRODUCTTAXDETAILS_M WHERE OUTLET_ID=" + outlet_id + " AND STATUS='A' AND ARTICLE_ID='" + article + "'");
                        articleDetail.add(articleBean);
                    }
                }
            }
        } catch (Exception e) {
            System.out.println("EXCEPTION IN GET article INFO :" + e.getMessage());
        } finally {
            if (rs != null) {
                rs.close();
            }
        }
        System.out.println("No. Of Articles Returned Are:" + articleDetail.size());
        return articleDetail;
    }

    public ArrayList getArticleDescInfo(String articleId) throws Exception {
        ResultSet rs = null, rs1 = null;
        ArrayList articleDetail = new ArrayList();
        System.out.println("ARTICLE ID IS====" + articleId);
        System.out.println("in ExtendedDAOORa getArticleInfo===");
        String qry = "";
        Connection conn = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            System.out.println("ANUJ CHECK2");
            conn = DriverManager.getConnection(url, userid, password);
            System.out.println("ANUJ CHECK3");
            if (!conn.isClosed()) {
                //String outletType = generalDAO.getOutletType(outlet_id);
                Statement st = conn.createStatement();
                qry = " SELECT articleDesc FROM sal_quotationarticledesc_t   WHERE articleId = '" + articleId + "' ";
                System.out.println("Query for ArticleDESC DETAILS" + qry);
                rs = st.executeQuery(qry);
                System.out.println("Query111" + qry);
                if (rs != null && rs.isBeforeFirst()) {
                    while (rs.next()) {
                        ArticleInBean articleBean = new ArticleInBean();
                        articleBean.setArticleTechDesc(rs.getString(1));
                        //rs1 = sh.executeQuery("select PERCENTAGE from GEN_PRODUCTTAXDETAILS_M WHERE OUTLET_ID=" + outlet_id + " AND STATUS='A' AND ARTICLE_ID='" + article + "'");
                        articleDetail.add(articleBean);
                    }

                } else {
                    for (int g = 0; g < 5; g++) {
                        ArticleInBean articleBean = new ArticleInBean();
                        articleBean.setArticleTechDesc(" ");
                        //rs1 = sh.executeQuery("select PERCENTAGE from GEN_PRODUCTTAXDETAILS_M WHERE OUTLET_ID=" + outlet_id + " AND STATUS='A' AND ARTICLE_ID='" + article + "'");
                        articleDetail.add(articleBean);
                    }
                }
            }
        } catch (Exception e) {
            System.out.println("EXCEPTION IN GET article INFO :" + e.getMessage());
        } finally {
            if (rs != null) {
                rs.close();
            }
        }
        System.out.println("No. Of Articles Returned Are:" + articleDetail.size());
        return articleDetail;
    }

    public ArrayList getArticleDescQty(String articleId) throws Exception {
        ResultSet rs = null;
        ArrayList articleDetail = new ArrayList();
        Connection conn = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            System.out.println("ANUJ CHECK2");
            conn = DriverManager.getConnection(url, userid, password);
            System.out.println("ANUJ CHECK3");
            if (!conn.isClosed()) {
                //String outletType = generalDAO.getOutletType(outlet_id);
                Statement st = conn.createStatement();
                String qry = "SELECT DISTINCT a.ARTICLE_CODE FROM inv_article_m a WHERE  upper(a.ARTICLE_CODE) like upper( '" + articleId + "%')  ORDER BY ARTICLE_CODE";
                System.out.println(qry);
                rs = st.executeQuery(qry);
                if (rs != null && rs.isBeforeFirst()) {
                    while (rs.next()) {
                        ArticleInBean articleBean = new ArticleInBean();
                        articleBean.setArticleDesc(rs.getString(1));
                        articleDetail.add(articleBean);
                    }

                }
            }
        } catch (Exception e) {
            System.out.println("EXCEPTION IN GET articleDesc :" + e.getMessage());
        } finally {
            if (rs != null) {
                rs.close();
                conn.close();
            }
        }
        return articleDetail;
    }

    public ArrayList getcontactDeatils(String contactName) throws Exception {
        ResultSet rs = null, rs1 = null;
        ArrayList contactDetail = new ArrayList();
        System.out.println("CONTACT NAME IS====" + contactName);
        System.out.println("in ExtendedDAOORa getArticleInfo===");
        String qry = "";
        Connection conn = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(url, userid, password);
            System.out.println("ANUJ CHECK3");
            if (!conn.isClosed()) {
                //String outletType = generalDAO.getOutletType(outlet_id);
                Statement st = conn.createStatement();
                qry = " select ContactAddress from sal_contactdetails_t where ContactName = '" + contactName + "' order by contactId ";
                System.out.println("Query for ArticleSet" + qry);
                rs = st.executeQuery(qry);
                System.out.println("Query111" + qry);
                if (rs != null && rs.isBeforeFirst()) {
                    while (rs.next()) {
                        generalBean genaral = new generalBean();
                        //genaral.setContactName(rs.getString(1));

                        genaral.setContactAddress(rs.getString(1).replace("<AnujTestingJKG>", "\n"));
                        contactDetail.add(genaral);
                    }

                } else {
                    for (int g = 0; g < 4; g++) {
                        generalBean genaral = new generalBean();
                        //genaral.setContactName(" ");
                        genaral.setContactAddress(" ");
                        //rs1 = sh.executeQuery("select PERCENTAGE from GEN_PRODUCTTAXDETAILS_M WHERE OUTLET_ID=" + outlet_id + " AND STATUS='A' AND ARTICLE_ID='" + article + "'");
                        contactDetail.add(genaral);
                    }
                }

                if (contactDetail.size() == 0) {
                    qry = "SELECT DISTINCT article_desc from inv_article_m where article_code=" + contactName + "";
                    rs = st.executeQuery(qry);
                    if (rs != null && rs.isBeforeFirst()) {
                        if (rs.next()) {
                            ArticleInBean articleBean = new ArticleInBean();
                            //.setArticleId(rs.getString(1));
                            articleBean.setArticleDesc(rs.getString(1));
                            //articleBean.("1");

                            contactDetail.add(articleBean);
                        }
                    }
                }
            }
        } catch (Exception e) {
            System.out.println("EXCEPTION IN GET article INFO :" + e.getMessage());
        } finally {
            if (rs != null) {
                rs.close();
            }
        }
        System.out.println("No. Of Articles Returned Are:" + contactDetail.size());
        return contactDetail;
    }

    public ArrayList getcountryDeatils(String CompanyName) throws Exception {
        ResultSet rs = null, rs1 = null;
        ArrayList countryDetail = new ArrayList();
        System.out.println("country NAME IS====" + CompanyName);
        System.out.println("in ExtendedDAOORa getArticleInfo===");
        String qry = "";
        Connection conn = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(url, userid, password);
            System.out.println("ANUJ CHECK3");
            if (!conn.isClosed()) {
                //String outletType = generalDAO.getOutletType(outlet_id);
                Statement st = conn.createStatement();
                qry = " select CountryAddress,CountryAddressValue from sal_countrydetails_t where CompanyName = '" + CompanyName + "'  ";
                System.out.println("Query for sal_countryDetails_t" + qry);
                rs = st.executeQuery(qry);
                System.out.println("Query111" + qry);
                if (rs != null && rs.isBeforeFirst()) {
                    while (rs.next()) {
                        generalBean genaral = new generalBean();
                        //genaral.setContactName(rs.getString(1));
                        genaral.setCountryAdd(rs.getString(1).replace("<AnujTestingJKG>", "\n"));
                        //genaral.setCountryAddVal(rs.getString(2).replace("<AnujTestingJKG>", "\n"));
                        countryDetail.add(genaral);
                    }

                } else {
                    for (int g = 0; g < 1; g++) {
                        generalBean genaral = new generalBean();
                        //genaral.setContactName(" ");
                        genaral.setCountryAdd("-");
                        genaral.setCountryAddVal("-");
                        //rs1 = sh.executeQuery("select PERCENTAGE from GEN_PRODUCTTAXDETAILS_M WHERE OUTLET_ID=" + outlet_id + " AND STATUS='A' AND ARTICLE_ID='" + article + "'");
                        countryDetail.add(genaral);
                    }
                }
            }
        } catch (Exception e) {
            System.out.println("EXCEPTION IN GET article INFO :" + e.getMessage());
        } finally {
            if (rs != null) {
                rs.close();
            }
        }
        System.out.println("No. Of Articles Returned Are:" + countryDetail.size());
        return countryDetail;
    }

    public Vector checlLogin(String userName, String pass) throws Exception {
        ResultSet rs = null;
        ArrayList countryDetail = new ArrayList();
        System.out.println("USER NAME IS====" + userName);
        System.out.println("PASS IN EXTE DAO IS====" + pass);
        System.out.println("in ExtendedDAOORa CHECKING LOGIN CREDENTIALS===");
        String qry = "";
        Connection conn = null;
        Vector rolesVec = new Vector();
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(url, userid, password);
            System.out.println("ANUJ CHECK3");
            if (!conn.isClosed()) {
                //String outletType = generalDAO.getOutletType(outlet_id);
                Statement st = conn.createStatement();
                qry = "select * from t_login_t where UserName='" + userName + "'and password='" + pass + "'";

                System.out.println("Query for AUTHENTICATIOn" + qry);
                String roles = "";

                rs = st.executeQuery(qry);
                System.out.println("Query111" + qry);
                if (rs.next()) {
                    System.out.println("ANUJ inside rs.next");
                    if (rs.getString("UserName").equals(userName) && rs.getString("password").equals(pass)) {
                        System.out.println("ANUJ inside checking if" + rs.getString("UserName"));
                        ResultSet rs1 = st.executeQuery("select * from t_rolemapping_t where UserName='" + rs.getString("UserName") + "'");
                        while (rs1.next()) {
                            System.out.println("ANUJ CHECKAAAAAA");
                            System.out.println("ANUJ CHECKAAAAAA" + rs1.getString("role_id"));
                            roles = roles + "'" + rs1.getString("role_id") + "'" + ",";
                        }
                    }
                    System.out.println(roles);
                    roles = roles.substring(0, roles.length() - 1);
                    System.out.println("NOW WAT" + roles);
                    ResultSet rs2 = st.executeQuery("select * from t_roles_t where roleid in (" + roles + ")");
                    while (rs2.next()) {
                        System.out.println("ANUJ Cuuuuuu" + rs2.getString("roleName"));
                        RolesBean rBean = new RolesBean();
                        System.out.println("ANUJ1");
                        rBean.setRoleName(rs2.getString("roleName"));
                        rBean.setRoleId(rs2.getString("roleid"));
                        System.out.println("ANUJ2");
                        rolesVec.add(rBean);
                        System.out.println("ANUJ3" + rolesVec.size());
                    }
                }
            }
        } catch (Exception e) {
            System.out.println("EXCEPTION IN CHECKING :" + e.getMessage());
        } finally {
            if (rs != null) {
                rs.close();
                conn.close();
            }
        }
        System.out.println("No. Of Articles Returned Are:" + countryDetail.size());
        return rolesVec;
    }

    public Vector getSubMenu(String menuId, String role) throws Exception {
        ResultSet rs = null;
        ArrayList countryDetail = new ArrayList();
        System.out.println("MENU ID IS====" + menuId);
        System.out.println("ROLE IN EXTE DAO IS====" + role);
        System.out.println("in ExtendedDAOORa CHECKING LOGIN CREDENTIALS===");
        String qry = "";
        Connection conn = null;
        Vector subMenuVec = new Vector();
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(url, userid, password);
            System.out.println("ANUJ CHECK3");
            if (!conn.isClosed()) {
                //String outletType = generalDAO.getOutletType(outlet_id);
                Statement st = conn.createStatement();
                qry = "select submenuId,subMenuName,href from t_submenu_t where menu_id='" + menuId + "'and roleId='" + role + "'";

                System.out.println("Query for AUTHENTICATIOn" + qry);
                String roles = "";

                rs = st.executeQuery(qry);
                System.out.println("Query111" + qry);
                if (rs != null) {

                    while (rs.next()) {
                        generalBean gb = new generalBean();
                        gb.setSubmenuId(rs.getString("submenuId"));
                        gb.setSubMenuName(rs.getString("subMenuName"));
                        gb.setSubMenuHref(rs.getString("href"));
                        subMenuVec.add(gb);

                    }
                    System.out.println("ANUJ3" + subMenuVec.size());
                }
            }
        } catch (Exception e) {
            System.out.println("EXCEPTION IN CHECKING :" + e.getMessage());
        } finally {
            if (rs != null) {
                rs.close();
                conn.close();
            }
        }
        System.out.println("No. Of Articles Returned Are:" + countryDetail.size());
        return subMenuVec;
    }

    public Hashtable getoptionDeatils(String articleId) throws Exception {
        ResultSet rs = null, rs1 = null;
        Hashtable optionDetail = new Hashtable();
        System.out.println("Article IDS ====" + articleId);
        System.out.println("in ExtendedDAOORa getArticleInfo===");
        String qry = "";
        Connection conn = null;
        String[] articleIds = articleId.split(",");
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(url, userid, password);
            System.out.println("ANUJ CHECK3");
            if (!conn.isClosed()) {
                //String outletType = generalDAO.getOutletType(outlet_id);
                for (int i = 0; i < articleIds.length; i++) {
                    Vector optionsVal = new Vector();
                    System.out.println("Query for sal_optiondetails_t" + articleIds[i]);
                    Statement st = conn.createStatement();
                    qry = " select itemCode,description,unitPrice,currency from sal_optiondetails_t where articleId IN ('" + articleIds[i] + "' ) ";
                    System.out.println("Query for sal_optiondetails_t" + qry);
                    rs = st.executeQuery(qry);
                    System.out.println("Query111" + qry);
                    if (rs != null && rs.isBeforeFirst()) {
                        while (rs.next()) {
                            ArticleInBean options = new ArticleInBean();
                            //genaral.setContactName(rs.getString(1));
                            options.setArticleOptionItem(rs.getString(1));
                            options.setArticleOptionDesc(rs.getString(2));
                            options.setArticleOptionPrice(rs.getString(3));
                            options.setArticleOptionCurr(rs.getString(4));
                            optionsVal.add(options);
                        }


                    } else {
                        for (int g = 0; g < 10; g++) {
                            ArticleInBean options = new ArticleInBean();
                            //genaral.setContactName(" ");
                            options.setArticleOptionItem("-");
                            options.setArticleOptionDesc("-");
                            options.setArticleOptionPrice("-");
                            options.setArticleOptionCurr("-");
                            optionsVal.add(options);
                        }

                    }
                    //System.out.println("&&&&&------>"+optionsVal.size());
                    optionDetail.put(articleIds[i], optionsVal);
                }
            }
        } catch (Exception e) {
            System.out.println("EXCEPTION IN GET article INFO :" + e.getMessage());
        } finally {
            if (rs != null) {
                rs.close();
                conn.close();
            }
        }
        System.out.println("No. Of optionDetail Returned Are:" + optionDetail.size());
        return optionDetail;
    }

    public String getSeqVale() throws Exception {
        ResultSet rs = null;
        String SeqVal = "";
        System.out.println("in ExtendedDAOORa getArticleInfo===");
        String qry = "";
        Connection conn = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(url, userid, password);
            System.out.println("ANUJ CHECK3");
            if (!conn.isClosed()) {
                Statement st = conn.createStatement();
                qry = " select max(ID) from seq";
                System.out.println("Query for sal_optiondetails_t" + qry);
                rs = st.executeQuery(qry);
                System.out.println("Query111" + qry);
                if (rs != null && rs.isBeforeFirst()) {
                    while (rs.next()) {
                        SeqVal = rs.getString(1);
                    }
                }
                System.out.println("&&&&&SeqVal------>" + SeqVal);
            }
        } catch (Exception e) {
            System.out.println("EXCEPTION IN GET article INFO :" + e.getMessage());
        } finally {
            if (rs != null) {
                rs.close();
                conn.close();
            }
        }

        return SeqVal;
    }

    public String saveQuotation(String[] arrQuotInfo, Hashtable hashInvoiceDetails, Vector hashArticleDesc, Vector hashArticleSpec, Vector ContactDetails, Vector otherDetails, Vector countryDetails, String CompanyName, String tot, Hashtable optionDetail) throws Exception {
        // public String saveInvoice(String[] arrInvoiceInfo, Hashtable hashInvoiceDetails, Hashtable hashArticleSet, Hashtable hashArticleOffer, Vector articlesInOffer, String emp_id, String gvNo, String outlet_type, Hashtable hashBlockedInventory,String exempt_tax,String[] arrCondition) throws Exception{
        generalBean genbean = new generalBean();
        genbean = (generalBean) otherDetails.get(0);
        String quotId = genbean.getQuotId();
        String quotDate = genbean.getDate();
        String quotSub = genbean.getSub();
        String contactName = genbean.getContactName();
        Statement stmt = null;
        Connection conn = null;
        int count = 0;

        String query = null;
        String article_ids = null;
        String Id = null;
        int maxLocalId = 0;
        ResultSet rs = null;
        try {
            String end_date = null;
            Class.forName("com.mysql.jdbc.Driver");
            System.out.println("ANUJ CHECK2");
            conn = DriverManager.getConnection(url, userid, password);
            System.out.println("ANUJ CHECK3");
            if (!conn.isClosed()) {
                conn.setAutoCommit(false);
                stmt = conn.createStatement();
                Enumeration enumchange = hashInvoiceDetails.keys();
                //Enumeration enumDesc = hashArticleDesc.keys();
                //Enumeration enumSpec = hashArticleSpec.keys();
                Statement st = conn.createStatement();
                //GoodsExitBean geb = new GoodsExitBean();

                Vector vecArticleList = new Vector();
                //System.out.println("$$$$$$$$$$$$$$$$ $$$$$$$$$$$$$$$$$$$$$$  hashArticleOffer.size() : "+hashArticleOffer.size());
                int kNo = 0;
                Vector vecArticlesInInvoice = new Vector();
                Vector vecArticlePriceInInvoice = new Vector();
                //boolean blockFlag = false;
                String tmpArticleId = "";
                String art = "";
                System.out.println("Converted string to date before : " + arrQuotInfo[2].trim());
                SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
                java.sql.Date convertedDate = new java.sql.Date(dateFormat.parse(arrQuotInfo[2].trim()).getTime());
                System.out.println("Converted string to date : " + convertedDate);
                query = "insert into seq(date) values('" + convertedDate + "')";
                System.out.println("In SAVE QUERY TO INSERT INTO SEQ IS" + query);
                count = stmt.executeUpdate(query);
                query = "insert into sal_quotation_t(ClientName,QuotDate,TotalAmt,Subject,Reference,loginId,CompanyName) values('" + arrQuotInfo[1] + "',"
                        + "'" + convertedDate + "','" + arrQuotInfo[3] + "',"
                        + "'" + arrQuotInfo[4] + "','" + arrQuotInfo[5] + "','" + arrQuotInfo[6] + "',"
                        + "'" + arrQuotInfo[7] + "'"
                        + ")";
                System.out.println("In SAVE QUERY TO INSERT INTO sal_quotation_t IS" + query);
                count = stmt.executeUpdate(query);
                //   System.out.println(" block 2 in save ");
                //System.out.println(" block II in save ");
                while (enumchange.hasMoreElements()) {
                    //System.out.println(" block III in save ");
                    String keyName = (String) enumchange.nextElement();
                    //     System.out.println(" block 3 in save ");
                    //vecArticleList.add(keyName);
                    int i = 0;
                    QuotationDetailsBean idb = (QuotationDetailsBean) hashInvoiceDetails.get(keyName);
                    tmpArticleId = idb.getArticleId();
                    if (Double.parseDouble(idb.getArticlePrice()) > 0.00) {
                        //       System.out.println(" block 4 in save ");
                        vecArticlesInInvoice.add(idb.getArticleId());
                        //     System.out.println(" block 5 in save " + idb.getArticle_id());
                        if (art.equals("")) {
                            art = idb.getArticleId();
                        }
                        double dblQty = Double.parseDouble(idb.getArticleQty());
                        //   System.out.println(" block 6 in save " + art);
                        double dblPrice = Double.parseDouble(idb.getArticlePrice());


                    }
                    query = "delete from sal_quotationdetails_t where articleId = '" + idb.getArticleId() + "'";
                    System.out.println(" QUERY TO DELETE sal_quotationdetails_t" + query);
                    count = stmt.executeUpdate(query);

                    query = "insert into sal_quotationdetails_t(articleId,ArticleDesc,ArticleTechDesc,articleQty,articleCurr,articlePrice) values('" + idb.getArticleId() + "','" + idb.getArticle_desc() + "','" + idb.getArticleDesc() + "', '" + idb.getArticleQty() + "', '" + idb.getArticleCurrency() + "', '" + idb.getArticlePrice() + "')";
                    System.out.println("In SAVE QUERY IS" + query);
                    count = stmt.executeUpdate(query);

                    query = "delete from inv_article_m where article_code = '" + idb.getArticleId() + "'";
                    System.out.println(" QUERY TO DELETE inv_article_m" + query);
                    count = stmt.executeUpdate(query);

                    query = "insert into inv_article_m(article_code,article_desc,article_currency,article_price) values('" + idb.getArticleId() + "','" + idb.getArticle_desc() + "','" + idb.getArticleCurrency() + "', '" + idb.getArticlePrice() + "')";
                    System.out.println("In SAVE QUERY IS" + query);
                    count = stmt.executeUpdate(query);

                    System.out.println("COUNT VALUE" + count);
                    //////arvind 6-10-5

                    if (count == 0) {
                        System.out.println("***** Exception while inserting data sal_invoicequotation_t *****");
                        throw new Exception();

                    } else {
                        Id = "true";
                        conn.commit();
                        System.out.println("############### COMMITTED " + Id);

                    }
                    query = "delete from sal_quotationarticledesc_t where articleId = '" + idb.getArticleId() + "'";
                    System.out.println(" QUERY TO DELETE sal_quotationarticledesc_t" + query);
                    count = stmt.executeUpdate(query);

                    query = "delete from sal_contactdetails_t where ContactName = '" + contactName + "'";
                    System.out.println(" QUERY TO DELETE sal_contactdetails_t" + query);
                    count = stmt.executeUpdate(query);

                    query = "delete from sal_countrydetails_t where CompanyName = '" + CompanyName + "'";
                    System.out.println(" QUERY TO DELETE sal_countrydetails_t" + query);
                    count = stmt.executeUpdate(query);

                    query = "delete from sal_optiondetails_t where articleId = '" + idb.getArticleId() + "'";
                    System.out.println(" QUERY TO DELETE sal_optiondetails_t" + query);
                    count = stmt.executeUpdate(query);

                    query = "delete from sal_quotationarticlespec_t where articleId = '" + idb.getArticleId() + "'";
                    System.out.println(" QUERY TO DELETE sal_quotationarticlespec_t" + query);
                    count = stmt.executeUpdate(query);

                }


                for (int d = 0; d < ContactDetails.size(); d++) {
                    //System.out.println(" block III in save ");
                    generalBean gBean = (generalBean) ContactDetails.get(d);
                    //     System.out.println(" block 3 in save ");
                    //vecArticleList.add(keyName);
                    if (gBean.getContactAddress() != null && !gBean.getContactAddress().equals("")) {
                        query = "insert into sal_contactdetails_t(ContactName,ContactAddress) values('" + gBean.getContactName() + "', '" + gBean.getContactAddress() + "')";
                        System.out.println("In SAVE QUERY FOR CONTACT DETAILS IS" + query);
                        count = stmt.executeUpdate(query);

                        System.out.println("COUNT VALUE" + count);
                        //////arvind 6-10-5
                    }
                    if (count == 0) {
                        System.out.println("***** Exception while inserting data sal_invoicequotation_t *****");
                        throw new Exception();

                    } else {
                        Id = "true";
                        conn.commit();
                        System.out.println("############### COMMITTED " + Id);

                    }
                }
                for (int d = 0; d < countryDetails.size(); d++) {
                    generalBean gBean = (generalBean) countryDetails.get(d);
                    if (gBean.getCountryAdd() != null && !gBean.getCountryAdd().equals("")) {
                        String checkQuery = "select count(*)  from sal_countrydetails_t where CompanyName='" + gBean.getCountryName() + "'";
                        query = "insert into sal_countrydetails_t(CompanyName,CountryAddress,CountryAddressValue) values('" + gBean.getCountryName() + "', '" + gBean.getCountryAdd() + "','"+ gBean.getCountryAddVal()+" ')";
                        String updateQuery = "update sal_countrydetails_t set CountryAddressValue='" + gBean.getCountryAddVal() + "' where CompanyName='" + gBean.getCountryName() + "'";
                        ResultSet rs1 = stmt.executeQuery(checkQuery);
                        if (rs1.next()) {
                            int numberOfRows = rs1.getInt(1);
                            if (numberOfRows == 0) {
                                count = stmt.executeUpdate(query);
                            } else {
                                count = stmt.executeUpdate(updateQuery);
                            }
                        }
                    }
                    if (count == 0) {
                        System.out.println("***** Exception while inserting data sal_invoicequotation_t *****");
                        throw new Exception();

                    } else {
                        Id = "true";
                        conn.commit();
                        System.out.println("############### COMMITTED " + Id);

                    }
                }
                Enumeration enumoptions = optionDetail.keys();
                Vector optionsVec = new Vector();
                while (enumoptions.hasMoreElements()) {
                    //System.out.println(" block III in save ");
                    String article_code = (String) enumoptions.nextElement();
                    //     System.out.println(" block 3 in save ");
                    //vecArticleList.add(keyName);
                    int i = 0;
                    optionsVec = (Vector) optionDetail.get(article_code);
                    for (int y = 0; y < optionsVec.size(); y++) {
                        ArticleInBean options = new ArticleInBean();
                        options = (ArticleInBean) optionsVec.get(y);
                        query = "insert into sal_optiondetails_t(articleId,itemCode,description,unitPrice,currency) values('" + article_code + "', '" + options.getArticleOptionItem() + "', '" + options.getArticleOptionDesc() + "', '" + options.getArticleOptionPrice() + "','USD')";
                        System.out.println("In SAVE QUERY IS" + query);
                        count = stmt.executeUpdate(query);

                        System.out.println("COUNT VALUE" + count);
                        //////arvind 6-10-5

                        if (count == 0) {
                            System.out.println("***** Exception while inserting data sal_invoicequotation_t *****");
                            throw new Exception();

                        } else {
                            Id = "true";
                            conn.commit();
                            System.out.println("############### COMMITTED " + Id);

                        }

                    }
                }

            }
            return Id;
        } catch (Exception e) {
            System.err.println("######## Problem while inserting the data by using the prepared statment : " + e);

            e.printStackTrace();
            try {
                conn.rollback();
                return "false";
            } catch (Exception ex) {
                ex.printStackTrace();
                return "false";
            }
        } finally {
            conn.close();
        }
    }
}
