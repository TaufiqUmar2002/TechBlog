package com.tech.entities;

import jakarta.persistence.*;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Random;

@Entity
@Table(name = "user_blog")
public class User {
    @Id
    @SequenceGenerator(name = "user_seq",sequenceName = "user_seq",allocationSize = 1)
    @GeneratedValue(strategy = GenerationType.SEQUENCE,generator = "user_seq")
    private Integer id;
    private String name;
    private String email;
    private String password;
    private String gender;
    private Long phoneNumber;
    private String about;
    private String profilePicPath;
    private LocalDateTime joinDate;
    @OneToMany(mappedBy = "user",cascade = CascadeType.ALL)
    private List<Post> post;

    public Integer getId() {
        return id;
    }

    public  User(){
    }

    public User(String name, String email, String password, String gender, Long phoneNumber, String about,String profilePicPath,LocalDateTime joinDate) {
        this.name = name;
        this.email = email;
        this.password = password;
        this.gender = gender;
        this.phoneNumber = phoneNumber;
        this.about = about;
        this.profilePicPath =profilePicPath;
        this.joinDate = joinDate;
    }

    public LocalDateTime getJoinDate() {
        return joinDate;
    }

    public void setJoinDate(LocalDateTime joinDate) {
        this.joinDate = joinDate;
    }



    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getAbout() {
        return about;
    }

    public void setAbout(String about) {
        this.about = about;
    }

    public Long getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(Long phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getProfilePicPath() {
        return profilePicPath;
    }

    public void setProfilePicPath(String profilePicPath) {
        this.profilePicPath = profilePicPath;
    }

    public List<Post> getPost() {
        return post;
    }

    public void setPost(List<Post> post) {
        this.post = post;
    }
}


//<!-- Animate.css for entry effects -->
//<link href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" rel="stylesheet">
//<script>
//$(document).ready(function () {
//    console.log("Signup Page Ready");
//
//    $('#reg-form').on('submit', function (event) {
//        event.preventDefault();
//        let form = new FormData(this);
//
//        $.ajax({
//                url: "signUpServlet",
//                type: 'POST',
//                data: form,
//                processData: false,
//                contentType: false,
//                dataType: "json", // expect JSON
//
//                beforeSend: function () {
//            Swal.fire({
//                    title: 'Creating Account',
//                    html: `
//                        <div class="d-flex flex-column align-items-center">
//                    <div class="spinner-border text-light" role="status" style="width:3rem; height:3rem;"></div>
//                    <p class="mt-3 mb-0 fw-semibold text-light">Please wait...</p>
//                    </div>
//                    `,
//            background: 'linear-gradient(145deg, #16a085, #1abc9c)',
//                    color: '#fff',
//                    showConfirmButton: false,
//                    allowOutsideClick: false,
//                    backdrop: `rgba(0, 0, 0, 0.4)`,
//            customClass: {
//                popup: 'rounded-4 shadow-lg border-0 animate__animated animate__fadeInDown'
//            }
//                });
//        },
//
//        success: function (response) {
//            console.log("Response:", response);
//
//            //  Display SweetAlert for both success & error
//            let isSuccess = response.status === "success";
//            let icon = isSuccess
//                    ? `<i class="fa-solid fa-circle-check" style="font-size:3rem; color:#fff;"></i>`
//                    : `<i class="fa-solid fa-triangle-exclamation" style="font-size:3rem; color:#fff;"></i>`;
//
//            let title = isSuccess ? 'Welcome to Note Tracker!' : 'Sign Up Failed!';
//            let bgColor = isSuccess
//                    ? 'linear-gradient(145deg, #16a085, #1abc9c)'
//                    : 'linear-gradient(145deg, #e74c3c, #c0392b)';
//
//            Swal.fire({
//                    iconHtml: icon,
//                    title: title,
//                    html: `<p class="text-light mb-3">${response.message}</p>`,
//            background: bgColor,
//                    color: '#fff',
//                    showConfirmButton: false,
//                    timer: 2000, // 2 seconds
//                    timerProgressBar: true,
//                    customClass: {
//                popup: 'rounded-4 shadow-lg border-0 animate__animated animate__fadeInUp'
//            },
//            willClose: () => {
//            if (response.redirect) {
//                window.location.href = response.redirect; // redirect sent by servlet
//            }
//                    }
//                });
//        },
//
//        error: function (jqXHR) {
//            console.error("AJAX Error:", jqXHR.responseText);
//
//            Swal.fire({
//                    iconHtml: `<i class="fa-solid fa-triangle-exclamation" style="font-size:3rem; color:#fff;"></i>`,
//            title: 'Something Went Wrong!',
//                    html: `<p class="text-light mb-3">
//                    ${jqXHR.responseText || 'An unexpected error occurred. Please try again.'}
//                    </p>`,
//            background: 'linear-gradient(145deg, #e74c3c, #c0392b)',
//                    color: '#fff',
//                    showConfirmButton: false,
//                    timer: 2000,
//                    timerProgressBar: true,
//                    customClass: {
//                popup: 'rounded-4 shadow-lg border-0 animate__animated animate__fadeInDown'
//            },
//            willClose: () => {
//                    window.location.href = "signup.jsp";
//                    }
//                });
//        }
//        });
//    });
//});
//</script>
