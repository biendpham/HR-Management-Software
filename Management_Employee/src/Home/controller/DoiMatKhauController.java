package Home.controller;

import Home.DAO.TaiKhoanDAO;
import Home.helper.Share;
import Home.helper.CustomDialog;
import Home.helper.Validate;
import Home.model.TaiKhoan;
import com.jfoenix.controls.JFXButton;
import com.jfoenix.controls.JFXPasswordField;
import java.net.URL;
import java.util.ResourceBundle;
import javafx.beans.value.ChangeListener;
import javafx.beans.value.ObservableValue;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Alert;
import javafx.scene.input.KeyCode;
import javafx.scene.input.KeyEvent;

public class DoiMatKhauController implements Initializable {

    @Override
    public void initialize(URL location, ResourceBundle resources) {
        try {
            tkdao = new TaiKhoanDAO();
            customDialog = new CustomDialog();
            validatorInit();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    //Phương thức khởi tạo validatorJFX
    public void validatorInit() {
        txtMatKhauCu.getValidators().add(Validate.createValidatorJFX("Vui lòng nhập tài khoản"));
        txtMatKhauCu.focusedProperty().addListener(new ChangeListener<Boolean>() {
            @Override
            public void changed(ObservableValue<? extends Boolean> observable, Boolean oldValue, Boolean newValue) {
                if (!newValue) {
                    txtMatKhauCu.validate();
                }
            }

        });

        txtMatKhauMoi.getValidators().add(Validate.createValidatorJFX("Vui lòng nhập mật khẩu"));
        txtMatKhauMoi.focusedProperty().addListener(new ChangeListener<Boolean>() {
            @Override
            public void changed(ObservableValue<? extends Boolean> observable, Boolean oldValue, Boolean newValue) {
                if (!newValue) {
                    txtMatKhauMoi.validate();
                }
            }

        });

        txtXacNhanMatKhau.getValidators().add(Validate.createValidatorJFX("Vui lòng nhập mật khẩu"));
        txtXacNhanMatKhau.focusedProperty().addListener(new ChangeListener<Boolean>() {
            @Override
            public void changed(ObservableValue<? extends Boolean> observable, Boolean oldValue, Boolean newValue) {
                if (!newValue) {
                    txtXacNhanMatKhau.validate();
                }
            }

        });
    }

    private boolean checkContent() {
        String regexEnglish = "[\\p{L}0-9 ]+";
        if (!txtMatKhauCu.getText().equals(Share.USER.getMatKhau())) {
            customDialog.showDialog(Share.stackPane, false, "Mật khẩu cũ không chính xác");
            txtXacNhanMatKhau.requestFocus();
            return false;
        }
        if (Validate.isNotMatches(txtMatKhauMoi, regexEnglish, "Mật khẩu mới không được chứa chữ cái có dấu, "
                + "và các ký tự đặc biệt")) {
            return false;
        }
        if (!txtMatKhauMoi.getText().equals(txtXacNhanMatKhau.getText())) {
            customDialog.showDialog(Share.stackPane, false, "Xác nhận mật khẩu không chính xác");
            return false;
        }
        return true;
    }

    @FXML
    void changePassword() {
        if (!txtMatKhauCu.validate() || !txtMatKhauMoi.validate() || !txtXacNhanMatKhau.validate()) {
            customDialog.showDialog(Share.stackPane, false, "Vui lòng nhập đầy đủ");
            return;
        }
        if (checkContent()) {
            TaiKhoan tk = new TaiKhoan();
            tk.setMaNV(Share.USER.getMaNV());
            tk.setTaiKhoan(Share.USER.getTaiKhoan());
            tk.setMatKhau(txtMatKhauMoi.getText());
            int kq = tkdao.update(tk);
            if (kq == 0) {
                customDialog.showDialog(Share.stackPane, false, "Có lỗi xảy ra, không thể đổi mật khẩu");
            } else {
                customDialog.showDialog(Share.stackPane, true, "Đổi mật khẩu thành công");
                Share.USER = tk;
            }
        }
    }

    @FXML
    void enterToChange(KeyEvent event) {
        if (event.getCode() == KeyCode.ENTER) {
            btnLogin.fire();
        }
    }

    @FXML
    void cancel(ActionEvent event) {
        Share.secondStage.close();
    }

    private TaiKhoanDAO tkdao;
    private CustomDialog customDialog;

    @FXML
    private JFXButton btnLogin;

    @FXML
    private JFXPasswordField txtMatKhauCu;

    @FXML
    private JFXPasswordField txtXacNhanMatKhau;

    @FXML
    private JFXPasswordField txtMatKhauMoi;

}
