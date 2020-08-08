package Model;

import java.util.ArrayList;
import sun.misc.Perf;

/**
 *
 * @author Renzo
 */
public class PerfilDAO extends DataBaseDAO {

    /**
     *
     * @throws Exception
     */
    public PerfilDAO() throws Exception {
    }

    /**
     *
     * @return @throws Exception
     * @author Renzo Nogueira.
     */
    public ArrayList<Perfil> getList() throws Exception {
        ArrayList<Perfil> list = new ArrayList<>();
        final String SQL = "SELECT * FROM perfil";
        this.connect();
        return null;
    }
}
