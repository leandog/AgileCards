package com.leandog.agile.cards;

import static com.xtremelabs.robolectric.Robolectric.shadowOf;

import org.junit.Test;
import org.junit.runner.RunWith;

import com.xtremelabs.robolectric.shadows.ShadowActivity;

@RunWith(TestRunner.class)
public class HomeActivityTest {

    //HomeActivity activity = new HomeActivity();

    @Test
    public void it_sets_content_view_when_created() {
    }

    private void startActivityLifeCycle() {
        ShadowActivity shadowActivity = shadowOf(activity);
        shadowActivity.create();
    }
}
