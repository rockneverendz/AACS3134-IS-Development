package entity;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.xml.bind.annotation.XmlRootElement;

@Entity
@Table(name = "TOKEN")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Token.findAll", query = "SELECT t FROM Token t")
    , @NamedQuery(name = "Token.findByTokenId", query = "SELECT t FROM Token t WHERE t.tokenId = :tokenId")
    , @NamedQuery(name = "Token.findByToken", query = "SELECT t FROM Token t WHERE t.token = :token")
    , @NamedQuery(name = "Token.findByStutus", query = "SELECT t FROM Token t WHERE t.stutus = :stutus")
    , @NamedQuery(name = "Token.findByDate", query = "SELECT t FROM Token t WHERE t.date = :date")
    , @NamedQuery(name = "Token.findByTime", query = "SELECT t FROM Token t WHERE t.time = :time")
    , @NamedQuery(name = "Token.findById", query = "SELECT t FROM Token t WHERE t.id = :id")})
public class Token implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "TOKEN_ID")
    private Integer tokenId;
    @Basic(optional = false)
    @Column(name = "TOKEN")
    private String token;
    @Basic(optional = false)
    @Column(name = "STUTUS")
    private String stutus;
    @Basic(optional = false)
    @Column(name = "DATE")
    @Temporal(TemporalType.DATE)
    private Date date;
    @Basic(optional = false)
    @Column(name = "TIME")
    @Temporal(TemporalType.TIME)
    private Date time;
    @Column(name = "ID")
    private Integer id;

    public Token() {
    }

    public Token(Integer tokenId) {
        this.tokenId = tokenId;
    }

    public Token(Integer tokenId, String token, String stutus, Date date, Date time) {
        this.tokenId = tokenId;
        this.token = token;
        this.stutus = stutus;
        this.date = date;
        this.time = time;
    }

    public Integer getTokenId() {
        return tokenId;
    }

    public void setTokenId(Integer tokenId) {
        this.tokenId = tokenId;
    }

    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token;
    }

    public String getStutus() {
        return stutus;
    }

    public void setStutus(String stutus) {
        this.stutus = stutus;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (tokenId != null ? tokenId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Token)) {
            return false;
        }
        Token other = (Token) object;
        if ((this.tokenId == null && other.tokenId != null) || (this.tokenId != null && !this.tokenId.equals(other.tokenId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entity.Token[ tokenId=" + tokenId + " ]";
    }

}