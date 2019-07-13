/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Home.controller;

import java.io.IOException;
import java.net.URL;
import java.util.ResourceBundle;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.scene.control.Label;
import javafx.scene.layout.BorderPane;

/**
 *
 * @author Duc Tung
 */
public class MainController implements Initializable {
     @FXML
    public BorderPane container;
    @FXML
    private Label label;
    
    @FXML
    private void handleButtonAction(ActionEvent event) {
        System.out.println("You clicked me!");
        
    }
    
    @Override
    public void initialize(URL url, ResourceBundle rb) {
        // TODO
    }    
        
    
    @FXML
    public void setContainer(){
        try {
            container.setCenter(FXMLLoader.load(getClass().getResource("/Home/gui/QLNV.fxml")));
        } catch (IOException ex) {
            ex.printStackTrace();
        }
    }
    
}
