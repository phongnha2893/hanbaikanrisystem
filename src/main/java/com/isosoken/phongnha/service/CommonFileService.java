package com.isosoken.phongnha.service;

import java.io.File;

public interface CommonFileService {

    void readExcelFile(File file, String fileType) throws Exception;

    void excuteWhenReadSuccess(File file);

    void excuteWhenReadFailed(File file);
}
