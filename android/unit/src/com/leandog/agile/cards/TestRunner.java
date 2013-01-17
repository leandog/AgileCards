package com.leandog.agile.cards;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import org.junit.runners.model.InitializationError;
import org.mockito.MockitoAnnotations;

import com.xtremelabs.robolectric.Robolectric;
import com.xtremelabs.robolectric.RobolectricConfig;
import com.xtremelabs.robolectric.RobolectricTestRunner;

public class TestRunner extends RobolectricTestRunner {

    public TestRunner(Class<?> testClass) throws InitializationError {
        super(testClass, new RobolectricConfig(new File("../app/")));
    }

    @Override
    protected void bindShadowClasses() {
        super.bindShadowClasses();
        Robolectric.bindShadowClasses(getShadows());
    }

    @Override
    public Object createTest() throws Exception {
        Object test = super.createTest();
        MockitoAnnotations.initMocks(test);
        return test;
    }

    public List<Class<?>> getShadows() {
        ArrayList<Class<?>> shadows = new ArrayList<Class<?>>();
        return shadows;
    }
}
