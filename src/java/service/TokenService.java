package service;

import entity.Token;
import javax.persistence.*;
import java.util.List;

public class TokenService {

    EntityManager em;

    public TokenService() {
        EntityManagerFactory emfactory = Persistence.createEntityManagerFactory("AACS3134-IS-DevelopmentPU");
        this.em = emfactory.createEntityManager();
    }

    public void addToken(Token token) throws RollbackException {
        em.getTransaction().begin();
        em.persist(token);
        em.getTransaction().commit();
    }

    public Token findTokenByID(int id) {
        return (Token) em.find(Token.class, id);
    }

    public Token findTokenByToken(String token) {
        return (Token) em.createNamedQuery("Token.findByToken")
                .setParameter("token", token)
                .getSingleResult();
    }

    /**
     * @param newToken The modified token
     * @return true if successfully committed false if token not found
     * @throws RollbackException If commit fails
     */
    public boolean updateToken(Token newToken) throws RollbackException {
        Token oldToken = findTokenByID(newToken.getTokenId());
        if (oldToken != null) {
            em.getTransaction().begin();
            oldToken.setStutus(newToken.getStutus());
            em.getTransaction().commit();
            return true;
        }
        return false;
    }

    public List<Token> findAll() {
        List TokenList = em.createNamedQuery("Token.findAll").getResultList();
        return TokenList;
    }

    public void close() {
        this.em.close();
    }
}
