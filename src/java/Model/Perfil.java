package Model;

/**
 *
 * @author Renzo
 */
public class Perfil {

    private int idPerfil;
    private String name;

    /**
     *
     */
    public Perfil() {
    }

    /**
     *
     * @param idPerfil
     * @param name
     */
    public Perfil(int idPerfil, String name) {
        this.idPerfil = idPerfil;
        this.name = name;
    }

    @Override
    public String toString() {
        return "Perfil{" + "idPerfil=" + idPerfil + ", name=" + name + '}';
    }  

    /**
     *
     * @return
     */
    public int getIdPerfil() {
        return idPerfil;
    }

    /**
     *
     * @param idPerfil
     */
    public void setIdPerfil(int idPerfil) {
        this.idPerfil = idPerfil;
    }

    /**
     *
     * @return
     */
    public String getName() {
        return name;
    }

    /**
     *
     * @param name
     */
    public void setName(String name) {
        this.name = name;
    }
}
