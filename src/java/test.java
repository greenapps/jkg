/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author admin
 */
import java.awt.Font;
import java.awt.Graphics;

import javax.swing.JFrame;
import javax.swing.JPanel;

public class test extends JPanel {

    public void paint(Graphics g) {
        Font f = new Font("Serif", Font.PLAIN, 12);
        g.setFont(f);
        g.drawString("Serif - PLAIN - 12", 10, 30);

        f = new Font("Sanserif", Font.ITALIC, 10);
        
        
        
        g.setFont(f);
        g.drawString("Sanserif - ITALIC - 10", 10, 60);

        f = new Font("Monospaced", Font.BOLD | Font.ITALIC, 14);
        g.setFont(f);
        g.drawString("Monospaced - BOLD and ITALIC - 14", 10, 90);

        f = new Font("Dialog", Font.PLAIN, 12);
        g.setFont(f);
        g.drawString("Dialog - PLAIN - 12", 10, 120);

        f = new Font("DialogInput", Font.BOLD + Font.ITALIC, 10);
        g.setFont(f);
        g.drawString("DialogInput - BOLD and ITALIC - 10", 10, 150);
    }

    public static void main(String[] args) {
        JFrame frame = new JFrame();
        frame.getContentPane().add(new test());

        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setSize(200, 200);
        frame.setVisible(true);
    }
}
