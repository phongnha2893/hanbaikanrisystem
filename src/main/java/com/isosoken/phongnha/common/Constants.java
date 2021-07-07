package com.isosoken.phongnha.common;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

public class Constants {
    public static enum ROLE {
        ADMIN, USER
    }

    public static enum PAYMENT_METHOD {
        RP, NSS;

        public static List<String> getValues() {
            return Arrays.stream(values()).map(Enum::name).collect(Collectors.toList());
        }
    }

    public static enum RECEIVABLE_BALANCE_IMPORT_TYPE {
        URIKAKEZANDAKA, RP, NSS
    }


    public static enum RECEIVABLE_BALANCE_IMPORT_STATUS {
        IN_PROGRESS, DONE, ERROR
    }

}
