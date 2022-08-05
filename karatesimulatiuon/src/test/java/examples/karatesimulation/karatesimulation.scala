package examples.karatesimulation
import com.intuit.karate.gatling.PreDef._
import io.gatling.core.Predef.{exec, openInjectionProfileFactory, rampUsers, scenario}
import io.gatling.core.scenario.Simulation
import scala.concurrent.duration.DurationInt


class karatesimulation extends Simulation {
  object Get {
    val getter = exec(karateFeature("C:\\Users\\91934\\Downloads\\karatesimulatiuon\\src\\test\\java\\examples\\karatesimulation\\karatesimulation.scala"))
  }
    var getUser = scenario("Get the user data from server").exec(Get.getter)

   setUp(getUser.inject(rampUsers(6).during(20.second)))

  }
