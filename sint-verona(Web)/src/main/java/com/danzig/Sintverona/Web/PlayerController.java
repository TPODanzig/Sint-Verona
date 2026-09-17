package com.danzig.Sintverona.Web;

import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/players")
@CrossOrigin(origins = "*")
public class PlayerController {

    private final PlayerRepository repo;

    public PlayerController(PlayerRepository repo) {
        this.repo = repo;
    }

    @PostMapping("/{id}/click")
    public Player click(@PathVariable String id) {
        Player p = repo.findById(id).orElseGet(() -> {
            Player np = new Player();
            np.setId(id);
            return np;
        });
        p.setClicks(p.getClicks() + 1);
        return repo.save(p);
    }

    @GetMapping("/{id}")
    public Player get(@PathVariable String id) {
        return repo.findById(id).orElseGet(() -> {
            Player np = new Player();
            np.setId(id);
            return np;
        });
    }


    @GetMapping("/total")
    public int total() {
        return repo.findAll().stream().mapToInt(Player::getClicks).sum();
    }
}