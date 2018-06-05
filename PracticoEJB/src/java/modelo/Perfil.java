
package modelo;

/**
 *
 * @author Informatica
 */
public class Perfil {
    private String profesion;
    private String experiencia;
    private String presentacion;

    public Perfil() {
    }

    public Perfil(String profesion, String experiencia, String presentacion) {
        this.profesion = profesion;
        this.experiencia = experiencia;
        this.presentacion = presentacion;
    }

    public String getProfesion() {
        return profesion;
    }

    public void setProfesion(String profesion) {
        this.profesion = profesion;
    }

    public String getExperiencia() {
        return experiencia;
    }

    public void setExperiencia(String experiencia) {
        this.experiencia = experiencia;
    }

    public String getPresentacion() {
        return presentacion;
    }

    public void setPresentacion(String presentacion) {
        this.presentacion = presentacion;
    }
    
    
}
