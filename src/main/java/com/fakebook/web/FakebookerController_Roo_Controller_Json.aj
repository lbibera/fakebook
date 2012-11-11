// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.fakebook.web;

import com.fakebook.domain.Fakebooker;
import com.fakebook.web.FakebookerController;
import java.util.List;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

privileged aspect FakebookerController_Roo_Controller_Json {
    
    @RequestMapping(value = "/{id}", headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> FakebookerController.showJson(@PathVariable("id") Long id) {
        Fakebooker fakebooker = fakebookerService.findFakebooker(id);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        if (fakebooker == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<String>(fakebooker.toJson(), headers, HttpStatus.OK);
    }
    
    @RequestMapping(headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> FakebookerController.listJson() {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        List<Fakebooker> result = fakebookerService.findAllFakebookers();
        return new ResponseEntity<String>(Fakebooker.toJsonArray(result), headers, HttpStatus.OK);
    }
    
    @RequestMapping(method = RequestMethod.POST, headers = "Accept=application/json")
    public ResponseEntity<String> FakebookerController.createFromJson(@RequestBody String json) {
        Fakebooker fakebooker = Fakebooker.fromJsonToFakebooker(json);
        fakebookerService.saveFakebooker(fakebooker);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        return new ResponseEntity<String>(headers, HttpStatus.CREATED);
    }
    
    @RequestMapping(value = "/jsonArray", method = RequestMethod.POST, headers = "Accept=application/json")
    public ResponseEntity<String> FakebookerController.createFromJsonArray(@RequestBody String json) {
        for (Fakebooker fakebooker: Fakebooker.fromJsonArrayToFakebookers(json)) {
            fakebookerService.saveFakebooker(fakebooker);
        }
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        return new ResponseEntity<String>(headers, HttpStatus.CREATED);
    }
    
    @RequestMapping(method = RequestMethod.PUT, headers = "Accept=application/json")
    public ResponseEntity<String> FakebookerController.updateFromJson(@RequestBody String json) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        Fakebooker fakebooker = Fakebooker.fromJsonToFakebooker(json);
        if (fakebookerService.updateFakebooker(fakebooker) == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<String>(headers, HttpStatus.OK);
    }
    
    @RequestMapping(value = "/jsonArray", method = RequestMethod.PUT, headers = "Accept=application/json")
    public ResponseEntity<String> FakebookerController.updateFromJsonArray(@RequestBody String json) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        for (Fakebooker fakebooker: Fakebooker.fromJsonArrayToFakebookers(json)) {
            if (fakebookerService.updateFakebooker(fakebooker) == null) {
                return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
            }
        }
        return new ResponseEntity<String>(headers, HttpStatus.OK);
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, headers = "Accept=application/json")
    public ResponseEntity<String> FakebookerController.deleteFromJson(@PathVariable("id") Long id) {
        Fakebooker fakebooker = fakebookerService.findFakebooker(id);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        if (fakebooker == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        fakebookerService.deleteFakebooker(fakebooker);
        return new ResponseEntity<String>(headers, HttpStatus.OK);
    }
    
}