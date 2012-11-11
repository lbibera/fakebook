// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.fakebook.domain;

import com.fakebook.domain.PostDataOnDemand;
import com.fakebook.domain.PostIntegrationTest;
import com.fakebook.service.PostService;
import java.util.List;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect PostIntegrationTest_Roo_IntegrationTest {
    
    declare @type: PostIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: PostIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext*.xml");
    
    declare @type: PostIntegrationTest: @Transactional;
    
    @Autowired
    private PostDataOnDemand PostIntegrationTest.dod;
    
    @Autowired
    PostService PostIntegrationTest.postService;
    
    @Test
    public void PostIntegrationTest.testCountAllPosts() {
        Assert.assertNotNull("Data on demand for 'Post' failed to initialize correctly", dod.getRandomPost());
        long count = postService.countAllPosts();
        Assert.assertTrue("Counter for 'Post' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void PostIntegrationTest.testFindPost() {
        Post obj = dod.getRandomPost();
        Assert.assertNotNull("Data on demand for 'Post' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Post' failed to provide an identifier", id);
        obj = postService.findPost(id);
        Assert.assertNotNull("Find method for 'Post' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'Post' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void PostIntegrationTest.testFindAllPosts() {
        Assert.assertNotNull("Data on demand for 'Post' failed to initialize correctly", dod.getRandomPost());
        long count = postService.countAllPosts();
        Assert.assertTrue("Too expensive to perform a find all test for 'Post', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<Post> result = postService.findAllPosts();
        Assert.assertNotNull("Find all method for 'Post' illegally returned null", result);
        Assert.assertTrue("Find all method for 'Post' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void PostIntegrationTest.testFindPostEntries() {
        Assert.assertNotNull("Data on demand for 'Post' failed to initialize correctly", dod.getRandomPost());
        long count = postService.countAllPosts();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<Post> result = postService.findPostEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'Post' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'Post' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void PostIntegrationTest.testFlush() {
        Post obj = dod.getRandomPost();
        Assert.assertNotNull("Data on demand for 'Post' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Post' failed to provide an identifier", id);
        obj = postService.findPost(id);
        Assert.assertNotNull("Find method for 'Post' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyPost(obj);
        Integer currentVersion = obj.getVersion();
        obj.flush();
        Assert.assertTrue("Version for 'Post' failed to increment on flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void PostIntegrationTest.testUpdatePostUpdate() {
        Post obj = dod.getRandomPost();
        Assert.assertNotNull("Data on demand for 'Post' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Post' failed to provide an identifier", id);
        obj = postService.findPost(id);
        boolean modified =  dod.modifyPost(obj);
        Integer currentVersion = obj.getVersion();
        Post merged = postService.updatePost(obj);
        obj.flush();
        Assert.assertEquals("Identifier of merged object not the same as identifier of original object", merged.getId(), id);
        Assert.assertTrue("Version for 'Post' failed to increment on merge and flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void PostIntegrationTest.testSavePost() {
        Assert.assertNotNull("Data on demand for 'Post' failed to initialize correctly", dod.getRandomPost());
        Post obj = dod.getNewTransientPost(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'Post' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected 'Post' identifier to be null", obj.getId());
        postService.savePost(obj);
        obj.flush();
        Assert.assertNotNull("Expected 'Post' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void PostIntegrationTest.testDeletePost() {
        Post obj = dod.getRandomPost();
        Assert.assertNotNull("Data on demand for 'Post' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Post' failed to provide an identifier", id);
        obj = postService.findPost(id);
        postService.deletePost(obj);
        obj.flush();
        Assert.assertNull("Failed to remove 'Post' with identifier '" + id + "'", postService.findPost(id));
    }
    
}
