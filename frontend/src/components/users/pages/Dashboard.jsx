import axios from 'axios'
import { Badge } from 'primereact/badge'
import { Card } from 'primereact/card'
import { Skeleton } from 'primereact/skeleton'
import React, { useEffect, useState } from 'react'
import { FaArrowDown, FaArrowUp } from 'react-icons/fa'
import { FcDown } from 'react-icons/fc'
import { motion } from "framer-motion";
import swal from 'sweetalert'
import ProductTables from '../ProductUpdates/ProductTables'

function Dashboard() {

    const [PriceMonitor, setPriceMonitor] = useState({
        copras: "",
        whole: "",
    });
    const [loading, setloading] = useState(true);

    useEffect(() => {
        PriceData();
    }, [])

    const PriceData = () => {
        axios.get(`/api/PriceMonitor`).then(res => {
            if (res.data.status === 200) {
                setPriceMonitor({
                    copras: res.data.copras,
                    whole: res.data.whole,
                });
            }
            setloading(false)
        }).catch((error) => {
            swal("Warning", error.response.statusText, 'warning');
        })
    }


    return (
        <>
            {
                loading ? <Skeleton className='w-100' />
                    :
                    <div className='container-fluid'>
                        <div className="row">
                            <div className="col-lg-6 col-md-6 col-sm-12 mb-2">
                                <motion.div
                                    initial={{ opacity: 0, scale: 0.5 }}
                                    animate={{ opacity: 1, scale: 1 }}
                                    transition={{
                                        duration: 0.8,
                                        delay: 0.4,
                                        ease: [0, 0.71, 0.2, 1.01]
                                    }}
                                >
                                    <Card title="Product Sold" className='zoom' >
                                        <div className="d-flex justify-content-between">
                                            <span>Total </span>
                                            <Badge severity={'success'} value={52} />
                                        </div>
                                    </Card>
                                </motion.div>
                            </div>
                            <div className="col-lg-6 col-md-6 col-sm-12 mb-2">
                                <motion.div
                                    initial={{ opacity: 0, scale: 0.5 }}
                                    animate={{ opacity: 1, scale: 1 }}
                                    transition={{
                                        duration: 0.8,
                                        delay: 0.6,
                                        ease: [0, 0.71, 0.2, 1.01]
                                    }}
                                >
                                    <Card title="Product Sold" className='zoom' >
                                        <div className="d-flex justify-content-between">
                                            <span>Total </span>
                                            <Badge severity={'success'} value={52} />
                                        </div>
                                    </Card>
                                </motion.div>
                            </div>
                            <div className="col-lg-12 col-md-6 col-sm-12 mb-2">
                                <motion.div
                                    initial={{ opacity: 0, scale: 0.5 }}
                                    animate={{ opacity: 1, scale: 1 }}
                                    transition={{
                                        duration: 0.8,
                                        delay: 0.8,
                                        ease: [0, 0.71, 0.2, 1.01]
                                    }}
                                >
                                    <Card title="Product Sold" className='zoom' >
                                        <div className="d-flex justify-content-between">
                                            <span>Total </span>
                                            <Badge severity={'success'} value={52} />
                                        </div>
                                    </Card>
                                </motion.div>
                            </div>
                        </div>

                        <div className="col-lg-12 col-md-12 col-sm-12 mb-2">
                            <motion.div
                                initial={{ opacity: 0, scale: 0.5 }}
                                animate={{ opacity: 1, scale: 1 }}
                                transition={{
                                    duration: 0.8,
                                    delay: 1.0,
                                    ease: [0, 0.71, 0.2, 1.01]
                                }}
                            >
                            <ProductTables />
                            </motion.div>
                        </div>

                    </div>
            }
        </>
    )
}

export default Dashboard