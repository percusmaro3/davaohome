package com.davaohome.bo.model.faq;

import com.davaohome.bo.model.base.RegisterInfo;
import lombok.Data;

@Data
public class Question extends RegisterInfo{

    private Integer questionNo;
    private String userName;
    private String userEmail;
    private String question;
    private String sendResult;
}
