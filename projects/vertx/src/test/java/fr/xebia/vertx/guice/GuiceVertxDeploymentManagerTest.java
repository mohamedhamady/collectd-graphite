package fr.xebia.vertx.guice;

import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;

import org.junit.Before;
import org.junit.Test;

import com.google.inject.Guice;
import com.google.inject.Injector;

import fr.xebia.xke.MainVerticle;
import io.vertx.core.AsyncResult;
import io.vertx.core.DeploymentOptions;
import io.vertx.core.Handler;
import io.vertx.core.Vertx;
import io.vertx.core.VertxOptions;
import io.vertx.core.eventbus.Message;
import io.vertx.ext.dropwizard.DropwizardMetricsOptions;

public class GuiceVertxDeploymentManagerTest {

	private Vertx vertx;

	private CountDownLatch lock = new CountDownLatch(10);

	@Before
	public void setUp() {
		vertx = Vertx.vertx(new VertxOptions().setMetricsOptions(
				new DropwizardMetricsOptions().setEnabled(true).setJmxEnabled(true).setJmxDomain("vertx-metrics")));

		Injector injector = Guice.createInjector(new GuiceVertxBinder(vertx));
		GuiceVerticleFactory guiceVerticleFactory = new GuiceVerticleFactory(injector);
		vertx.registerVerticleFactory(guiceVerticleFactory);
	}

	@Test
	public void testDeployVerticleWithOptions() throws InterruptedException {
		GuiceVertxDeploymentManager deploymentManager = new GuiceVertxDeploymentManager(this.vertx);
		deploymentManager.deployVerticle(MainVerticle.class, new DeploymentOptions().setWorker(true));

		vertx.eventBus().send("/ping-address", "ping!", new Handler<AsyncResult<Message<String>>>() {
			@Override
			public void handle(AsyncResult<Message<String>> reply) {
				lock.countDown();
				System.out.println(reply.result().body());
			}
		});

		lock.await(4, TimeUnit.MINUTES);
	}
}
