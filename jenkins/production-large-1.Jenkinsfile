pipeline {
    agent any;
    environment {
        ROUTING_CORES = 32;
    }
    stages {

        stage("Run Tests") {
            matrix {

                axes {
                    axis {
                        name "DESIGN";
                        values 'ASU_GP22',
                               'crypto_aes128',
                               'crypto_accelerator accelerator_top',
                               'ExperiarSoC ExpSoc_Peripherals_Flat',
                               'ExperiarSoC ExperiarCore',
                               'FCNet_neuron',
                               'FPU_Bfloat_16',
                               'FPU_Single_Precision',
                               'FPU_half_precision',
                               'IIC_AudioDAC',
                               'UETRV_Ecore UETRV_Wishbone_InterConnect',
                               'junga_soc_mpw5',
                               'ks-guitar',
                               'mpw5_raster_engine',
                               'mpw7_SoomRV',
                               'openram_openmpw',
                               'patmos_chip',
                               'pwm_openmpw',
                               'qf100 qf_mkLanaiCPU',
                               'riscduino rd_yifive',
                               'riscduino_S4 rdS4_ycr_intf',
                               'riscduino_S4 rdS4_ycr_core_top',
                               'riscduino_qcore rdq_ycr4_iconnect',
                               'SonarOnChip8',
                               'soric_project crypto_core',
                               'soric_project flexbex_core',
                               'treepram',
                               'wishbone_CAN',
                               'yifive_a2 syntacore';
                    }
                }

                stages {
                    stage("Test") {
                        options {
                            timeout(time: 14, unit: "HOURS");
                        }
                        agent any;
                        steps {
                            script {
                                stage("${DESIGN}") {
                                    retry(3) {
                                        sh "nice ./scripts/setup-ci.sh";
                                    }
                                    sh "nice ./scripts/run-design.sh ${DESIGN}";
                                }
                            }
                        }
                        post {
                            failure {
                                archiveArtifacts artifacts: "**/runs/**/*";
                            }
                        }
                    }
                }

            }
        }
    }

    post {
        failure {
            script {
                try {
                    COMMIT_AUTHOR_EMAIL = sh (returnStdout: true, script: "git --no-pager show -s --format='%ae'").trim();
                    if ( env.BRANCH_NAME == "main" ) {
                        echo("Main development branch: report to stakeholders and commit author.");
                        EMAIL_TO="$COMMIT_AUTHOR_EMAIL, \$DEFAULT_RECIPIENTS";
                    } else {
                        echo("Feature development branch: report only to commit author.");
                        EMAIL_TO="$COMMIT_AUTHOR_EMAIL";
                    }
                } catch (Exception e) {
                    echo "Exception occurred: " + e.toString();
                    EMAIL_TO="\$DEFAULT_RECIPIENTS";
                }
                emailext(
                        to: "$EMAIL_TO",
                        subject: '$DEFAULT_SUBJECT',
                        body: '$DEFAULT_CONTENT',
                        );
            }
        }
    }

}
