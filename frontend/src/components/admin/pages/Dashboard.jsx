import React, { useEffect, useRef, useState } from 'react'
import { Card } from 'primereact/card';
import { Button } from 'primereact/button';
import LineChart from '../analytics/LineChart';
import BarChart from '../analytics/BarChartdata';
import BarChartdata from '../analytics/BarChartdata';
import TableRecords from '../analytics/TableRecords';
import PieChartdata from '../analytics/PieChartdata';
import { FcApproval, FcApprove, FcContacts, FcDisapprove } from 'react-icons/fc';
import { TieredMenu } from 'primereact/tieredmenu';
import { Badge } from 'primereact/badge';
import { Knob } from 'primereact/knob';
import axios from 'axios';
import swal from 'sweetalert';
import { Skeleton } from 'primereact/skeleton';
import { motion } from "framer-motion";



function Dashboard() {

    const [CountData, setCountData] = useState({
        allcount: "",
        verified: "",
        pending: "",
        report: "",
        copras_total: "",
        whole_total: "",
        copras_price: "",
        whole_price: "",
        copras_sold: "",
        whole_sold: "",
    });
    const [loading, setloading] = useState(true);

    useEffect(() => {
        AllDataTotal();
    }, []);

    const AllDataTotal = () => {
        axios.get(`/api/TotalCount`).then(res => {
            if (res.data.status === 200) {
                setCountData({
                    allcount: res.data.allaccounts,
                    verified: res.data.verified,
                    pending: res.data.pending,
                    report: res.data.reports,

                })
            }
            else {

            }
            setloading(false);
        }).catch((error) => {
            if (error.response.status === 500) {
                swal("Warning", error.response.statusText, 'warning');
            }
        })
    }

    return (
        <div className='container-fluid p-4'>
            {
                loading ? <Skeleton />
                    :
                    <div className="row">
                        <div className="col-lg-3 col-md-6 col-sm-12 mb-4">
                            <motion.div
                                initial={{ opacity: 0, scale: 0.5 }}
                                animate={{ opacity: 1, scale: 1 }}
                                transition={{
                                    duration: 0.8,
                                    delay: 0.4,
                                    ease: [0, 0.71, 0.2, 1.01]
                                }}
                            >
                                <Card title="All Accounts" className='zoom' >
                                    <div className="d-flex justify-content-between">
                                        <span>Total </span>
                                        <Badge severity={'info'} value={CountData.allcount} />
                                    </div>
                                </Card>
                            </motion.div>
                        </div>
                        <div className="col-lg-3 col-md-6 col-sm-12 mb-4">
                            <motion.div
                                initial={{ opacity: 0, scale: 0.5 }}
                                animate={{ opacity: 1, scale: 1 }}
                                transition={{
                                    duration: 0.5,
                                    delay: 0.5,
                                    ease: [0, 0.71, 0.2, 1.01]
                                }}
                            >
                                <Card title="Verified Account" className='zoom' >
                                    <div className="d-flex justify-content-between">
                                        <span>Total </span>
                                        <Badge severity={'success'} value={CountData.verified} />
                                    </div>
                                </Card>
                            </motion.div>

                        </div>
                        <div className="col-lg-3 col-md-6 col-sm-12 mb-4">
                            <motion.div
                                initial={{ opacity: 0, scale: 0.5 }}
                                animate={{ opacity: 1, scale: 1 }}
                                transition={{
                                    duration: 0.6,
                                    delay: 0.6,
                                    ease: [0, 0.71, 0.2, 1.01]
                                }}
                            >
                                <Card title={<><span><small>Pending Account</small></span></>} className='zoom' >
                                    <div className="d-flex justify-content-between">
                                        <span>Total </span>
                                        <Badge value={CountData.pending} />
                                    </div>
                                </Card>
                            </motion.div>
                        </div>
                        <div className="col-lg-3 col-md-6 col-sm-12 mb-4">
                            <motion.div
                                initial={{ opacity: 0, scale: 0.5 }}
                                animate={{ opacity: 1, scale: 1 }}
                                transition={{
                                    duration: 0.6,
                                    delay: 0.7,
                                    ease: [0, 0.71, 0.2, 1.01]
                                }}
                            >
                                <Card title="Report Issue" className='zoom' >
                                    <div className="d-flex justify-content-between">
                                        <span>Total </span>
                                        <Badge severity={'danger'} value={CountData.report} />
                                    </div>
                                </Card>
                            </motion.div>
                        </div>
                        <motion.div
                            initial={{ opacity: 0, scale: 0.5 }}
                            animate={{ opacity: 1, scale: 1 }}
                            transition={{
                                duration: 0.6,
                                delay: 1.3,
                                ease: [0, 0.71, 0.2, 1.01]
                            }}
                        >
                            <div className="row mb-3">
                                <div className="col-lg-6 col-sm-12 mb-2">
                                    {/* <Card title="Most Sells Product"> */}
                                        <PieChartdata />
                                    {/* </Card> */}
                                </div>
                                <div className="col-lg-6 col-sm-12 mb-2">
                                    {/* <Card title="Products"> */}
                                        <BarChartdata />
                                        {/* <PieChartdata /> */}
                                    {/* </Card> */}
                                </div>
                                <div className="col-lg-12 col-sm-12 mb-2">
                                    <TableRecords />
                                </div>
                            </div>
                        </motion.div>

                        {/* <div className="row mb-3">
                            <div className="col-lg-6 col-md-6 col-sm-12 mb-2">
                                <LineChart />
                            </div>
                            <div className="col-lg-6 col-md-6 col-sm-12 mb-2">
                                <BarChartdata />
                            </div>
                            <div className="col-lg-12 col-md-6 col-sm-12 mb-2">
                                <LineChart />
                            </div>
                        </div> */}
                    </div>
            }


        </div>
    )
}

export default Dashboard