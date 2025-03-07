
allprojects {
    tasks.register("listModules") {
        doLast {
            rootProject.subprojects.forEach {
                logger.lifecycle(it.path)
            }
        }
    }
}

