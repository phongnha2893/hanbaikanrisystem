package com.isosoken.phongnha.common.storage;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationFeature;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.core.env.Environment;

import java.io.*;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.StandardOpenOption;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Optional;

public class FileStorage {

    private final static Logger logger = LoggerFactory.getLogger(FileStorage.class);

    private final static String JSON = ".json";
    private final static String UTF_8 = "utf-8";
    private final static String CSV = ".csv";

    protected File dir;

    public FileStorage(Environment environment, StorageType storageType, String storage) { //"insert"
        this.dir = getDirectory(environment, storage, storageType);
        if (!this.dir.exists()) this.dir.mkdirs();
    }

    public void save(String name, Object object) {
        try {
            ObjectMapper mapper = new ObjectMapper();
            mapper.enable(SerializationFeature.INDENT_OUTPUT);
            String json = mapper.writeValueAsString(object);
            saveJson(name, json);
        } catch (Exception e) {
            logger.error(e.getMessage(), e);
        }
    }

    public File getCsvFile(String name) {
        return new File(dir, name + CSV);
    }


    public boolean isExpire(String name, long timeInMilisecond) {
        File file = new File(dir, name + JSON);
        if (!file.exists() || file.isDirectory() || file.length() < 1) return true;
        return System.currentTimeMillis() - file.lastModified() > timeInMilisecond;
    }

    public String getDateAsName() {
        SimpleDateFormat dateFormat = new SimpleDateFormat("ddMMyyyy");
        return dateFormat.format(new Date());
    }

    public File getDir() {
        return dir;
    }

    public File getChild(String folder) {
        return new File(dir, folder);
    }

    public void saveJson(String name, String json) {
        try {
            File file = new File(dir, name + JSON);
            Files.write(file.toPath(), json.getBytes(UTF_8), StandardOpenOption.WRITE, StandardOpenOption.CREATE);
        } catch (Exception e) {
            logger.error(e.getMessage(), e);
        }
    }

    public void saveCvs(String name, String csv) {
        try {
            saveCvs(name, csv.getBytes(UTF_8));
        } catch (Exception e) {
            logger.error(e.toString(), e);
        }
    }

    public Path saveCvs(String name, byte[] bytes) {
        try {
            File file = new File(dir, name + CSV);
            if (file.exists()) {
                boolean result = file.delete();
                logger.info("Delete old file " + file.getName() + " - " + result);
            }
            return Files.write(file.toPath(), bytes, StandardOpenOption.WRITE, StandardOpenOption.CREATE);
        } catch (Exception e) {
            logger.error(e.getMessage(), e);
        }
        return null;
    }

    public Path saveFile(String name, byte[] bytes) {
        try {
            File file = new File(dir, name);
            if (file.exists()) {
                boolean result = file.delete();
                logger.info("Delete old file " + file.getName() + " - " + result);
            }
            logger.info("Save file " + file.getAbsolutePath());
            return Files.write(file.toPath(), bytes, StandardOpenOption.WRITE, StandardOpenOption.CREATE);
        } catch (IOException e) {
            logger.error(e.getMessage(), e);
        }
        return null;
    }

    public boolean deleteFile(String fileName) {
        File file = new File(dir, fileName);
        boolean result = false;
        if (file.exists()) {
            result = file.delete();
            logger.info("Delete old file " + file.getName() + " - " + result);
        }
        return result;
    }


    public String loadTextFile(File textFile, boolean isEmailTextFile) {
        if (textFile == null || !textFile.exists() || textFile.isDirectory()) return null;
        String fileName = textFile.getName();
        if (fileName.endsWith(".processing")) {
            fileName = fileName.replace(".processing", "");
        }
        Optional<String> extension = getExtension(fileName);
        if (!extension.isPresent()) return null;
        switch (extension.get()) {
            case "txt":
            case "csv":
                return readPlainTextFile(textFile, isEmailTextFile);
//            case "doc":
//            case "docx":
//                return readMsWordDocFile(textFile, isEmailTextFile);
            default:
                return null;
        }
    }

    public String readPlainTextFile(File plainTextFile, boolean isEmailTextFile) {
        if (plainTextFile == null || !plainTextFile.exists() || plainTextFile.isDirectory() || plainTextFile.length() < 1)
            return null;
        try (FileInputStream inputStream = new FileInputStream(plainTextFile);
             InputStreamReader reader = new InputStreamReader(inputStream, UTF_8);
             BufferedReader bufferedReader = new BufferedReader(reader)) {
            StringBuilder stringBuilder = new StringBuilder();
            String line;
            while ((line = bufferedReader.readLine()) != null) {
                stringBuilder.append(line);
                if (isEmailTextFile) {
                    stringBuilder.append("<br>");
                } else {
                    stringBuilder.append("\n");
                }
            }
            return stringBuilder.toString();
        } catch (Exception e) {
            logger.error(plainTextFile.getAbsolutePath() + " - " + e.getMessage(), e);
        }
        return null;
    }

//    public String readMsWordDocFile(File docFile, boolean isEmailTextFile) {
//        if (docFile == null || !docFile.exists() || docFile.isDirectory())
//            return null;
//        try (FileInputStream fis = new FileInputStream(docFile);
//             XWPFDocument document = new XWPFDocument(OPCPackage.open(fis))) {
//            List<XWPFParagraph> paragraphs = document.getParagraphs();
//            StringBuilder stringBuilder = new StringBuilder();
//            for (XWPFParagraph paragraph : paragraphs) {
//                stringBuilder.append(paragraph.getParagraphText());
//                if (isEmailTextFile) {
//                    stringBuilder.append("<br>");
//                } else {
//                    stringBuilder.append("\n");
//                }
//            }
//            return stringBuilder.toString();
//        } catch (Exception e) {
//            logger.error(e.toString(), e);
//        }
//        return null;
//    }

    public Optional<String> getExtension(String filename) {
        return Optional.ofNullable(filename)
                .filter(f -> f.contains("."))
                .map(f -> f.substring(filename.lastIndexOf('.') + 1));
    }

    public <T> T loadObject(String name, TypeReference<T> typeReference) {
        File file = new File(dir, name + JSON);
        if (!file.exists() || file.isDirectory() || file.length() < 1) return null;

        ObjectMapper mapper = new ObjectMapper();

        try {
            byte[] bytes = Files.readAllBytes(file.toPath());
            String json = new String(bytes, UTF_8);
            return mapper.readValue(json, typeReference);
        } catch (Exception e) {
            logger.error(file.getAbsolutePath() + " - " + e.getMessage(), e);
        }
        return null;
    }


    public <T> T loadObject(String name, Class<T> clazz) {
        File file = new File(dir, name + JSON);
        if (!file.exists() || file.isDirectory() || file.length() < 1) return null;

        ObjectMapper mapper = new ObjectMapper();

        try {
            byte[] bytes = Files.readAllBytes(file.toPath());
            String json = new String(bytes, UTF_8);
            return mapper.readValue(json, clazz);
        } catch (Exception e) {
            logger.error(file.getAbsolutePath() + " - " + e.getMessage(), e);
        }
        return null;
    }

    private File getDirectory(Environment environment, String storage, StorageType storageType) {
        String dataDir = environment.getProperty("user.dir");
        String fileServerFolderMount = environment.getProperty("data.file-server-mount-folder", "file-server-mount");
        File folder;
        switch (storageType) {
            case FILE_SERVER:
                folder = new File(dataDir, File.separator + fileServerFolderMount + File.separator + storage + File.separator);
                break;
            case LOCAL:
            default:
                folder = new File(dataDir, File.separator + storage + File.separator);
        }
        try {
            folder = folder.getCanonicalFile();
        } catch (Exception e) {
            logger.error(e.getMessage(), e);
        }
        if (!folder.exists()) folder.mkdirs();
        return folder;
    }

    public static enum StorageType {LOCAL, FILE_SERVER}
}
