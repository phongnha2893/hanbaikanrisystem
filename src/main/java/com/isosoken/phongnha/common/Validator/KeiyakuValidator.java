package com.isosoken.phongnha.common.Validator;

import com.isosoken.phongnha.model.Customer;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

@Component
public class KeiyakuValidator implements Validator {
    @Override
    public boolean supports(Class<?> aClass) {
        return Customer.class.equals(aClass);
    }

    @Override
    public void validate(Object o, Errors errors) {
//        Customer customer = (Customer) o;
//        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "sender", "NotEmpty");
//        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "companyName", "NotEmpty");
//        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "standardQuantity", "NotEmpty");
//        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "standardName1", "NotEmpty");
//        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "standardRegistrationType1", "NotEmpty");
//        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "price", "NotEmpty");
//        try {
//            int price = Integer.parseInt(""+ customer.getPrice());
//            if (price < 10000) errors.rejectValue("price", "Amount.contractForm.price");
//
//        } catch (Exception e) {
//            errors.rejectValue("price", "Amount.contractForm.price");
//        }
//        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "contractStartDate", "NotEmpty");
//        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "prefectures", "NotEmpty");
//        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "personInCharge", "NotEmpty");
//        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "phoneNumber", "NotEmpty");
//        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "mailAddress", "NotEmpty");
//        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "nearestStation", "NotEmpty");
//        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "postalCode", "NotEmpty");
//        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "address", "NotEmpty");
//        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "contractWindow", "NotEmpty");
//        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "invoiceAddress", "NotEmpty");
//        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "saleStaff", "NotEmpty");
//        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "unitPriceIncreaseStaff", "NotEmpty");
//        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "musashinoProject", "NotEmpty");
//        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "bussinessOver5Years", "NotEmpty");
//        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "staffQuantity", "NotEmpty");
//        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "isNEXT", "NotEmpty");
//        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "personInChargeGood", "NotEmpty");
//        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "ordersReceivedType", "NotEmpty");
//        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "signContractReason", "NotEmpty");
//        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "isWithPlusOne", "NotEmpty");
//        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "isGroupChatwork", "NotEmpty");
//        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "headquartersAddress", "NotEmpty");
//        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "paymentTerm", "NotEmpty");
//        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "representativeName1", "NotEmpty");
//

    }
}
