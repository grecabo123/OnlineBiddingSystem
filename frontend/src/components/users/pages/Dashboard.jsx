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
import BarChartdata from '../../admin/analytics/BarChartdata'
import { Panel } from 'primereact/panel'
import { TabView, TabPanel } from 'primereact/tabview';
import { Rating } from 'primereact/rating'
import Monthly from '../Profit/Monthly'
import Kilo from './Average/Kilo'
import ProductTransaction from './Product/ProductTransaction'


function Dashboard() {

    const [ProductCount, setProductCount] = useState({
        overall: "",
        whole: "",
        name: "",
        income: "",
        sold: "",
        pending: "",
    });

    const [activeIndex, setActiveIndex] = useState(0);
    const [loading, setloading] = useState(true);

    useEffect(() => {
        PriceData();
    }, [])

    const PriceData = () => {
        axios.get(`/api/AllProductsTotal/${localStorage.getItem('auth_id')}`).then(res => {
            if (res.data.status === 200) {
                setProductCount({
                    overall: res.data.overall,
                    whole: res.data.whole,
                    name: res.data.name,
                    income: res.data.income,
                    sold: res.data.sold,
                    pending: res.data.pending,
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
                            <div className="col-lg-3 col-md-6 col-sm-12 mb-2">
                                <motion.div
                                    initial={{ opacity: 0, scale: 0.5 }}
                                    animate={{ opacity: 1, scale: 1 }}
                                    transition={{
                                        duration: 0.8,
                                        delay: 0.4,
                                        ease: [0, 0.71, 0.2, 1.01]
                                    }}
                                >
                                    <Card title="All Products" className='zoom' >
                                        <div className="d-flex justify-content-between">
                                            <span>Total </span>
                                            <Badge severity={'success'} value={ProductCount.overall} />
                                        </div>
                                    </Card>
                                </motion.div>
                            </div>
                            <div className="col-lg-3 col-md-6 col-sm-12 mb-2">
                                <motion.div
                                    initial={{ opacity: 0, scale: 0.5 }}
                                    animate={{ opacity: 1, scale: 1 }}
                                    transition={{
                                        duration: 0.8,
                                        delay: 0.6,
                                        ease: [0, 0.71, 0.2, 1.01]
                                    }}
                                >
                                    <Card title="Overall Income" className='zoom' >
                                        <div className="d-flex justify-content-between">
                                            <span>Total Amount</span>
                                            <span>₱{ProductCount.income[0].total === null ? "0.00" : ProductCount.income[0].total.toFixed(2).replace(/\B(?=(\d{3})+(?!\d))/g, ",")}</span>
                                            {/* <Badge severity={'success'} value={0} /> */}
                                        </div>
                                    </Card>
                                </motion.div>
                            </div>
                            <div className="col-lg-3 col-md-6 col-sm-12 mb-2">
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
                                            <Badge severity={'success'} value={ProductCount.sold == null ? 0 : ProductCount.sold} />
                                        </div>
                                    </Card>
                                </motion.div>
                            </div>
                            <div className="col-lg-3 col-md-6 col-sm-12 mb-2">
                                <motion.div
                                    initial={{ opacity: 0, scale: 0.5 }}
                                    animate={{ opacity: 1, scale: 1 }}
                                    transition={{
                                        duration: 1.0,
                                        delay: 0.8,
                                        ease: [0, 0.71, 0.2, 1.01]
                                    }}
                                >
                                    <Card title="Product Sell" className='zoom' >
                                        <div className="d-flex justify-content-between">
                                            <span>Total </span>
                                            <Badge severity={'success'} value={ProductCount.pending} />
                                        </div>
                                    </Card>
                                </motion.div>
                            </div>

                        </div>
                        <div className="row">
                            <div className="col-lg-6 col-md-12 col-sm-12 mb-2">
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

                            <div className="col-lg-6 col-md-12 col-sm-12 mb-2">
                                <motion.div
                                    initial={{ opacity: 0, scale: 0.5 }}
                                    animate={{ opacity: 1, scale: 1 }}
                                    transition={{
                                        duration: 0.8,
                                        delay: 1.0,
                                        ease: [0, 0.71, 0.2, 1.01]
                                    }}
                                >
                                    {/* <Card title="Price Monitoring"> */}
                                        <BarChartdata />
                                        <div className="mt-3 ">
                                            The Price of product will update after 1 week.
                                        </div>
                                    {/* </Card> */}
                                    <div className="col-lg-12 mt-3 mb-3">
                                        <Card title="Account Review">
                                            <TabView activeIndex={activeIndex} onTabChange={(e) => setActiveIndex(e.index)}>
                                                <TabPanel header="Acount Rating">
                                                    <div className="">
                                                        <h6>Name:  {ProductCount.name.name_user}</h6>
                                                    </div>
                                                    <Rating readOnly className='' stars={10} value={6} cancel={false} />
                                                </TabPanel>
                                                <TabPanel header="Feedback">
                                                    Comments
                                                </TabPanel>
                                            </TabView>
                                        </Card>
                                        
                                    </div>
                                </motion.div>
                            </div>
                            <div className="mt-3 col-lg-6">
                                <Panel header="Average Monthly Kilo" >
                                    {/* <Monthly /> */}
                                    <Kilo />
                                </Panel>
                            </div>
                            <div className="mt-3 col-lg-6">
                                <Panel header="Product Per Transaction" >
                                    {/* <Monthly /> */}
                                    <ProductTransaction />
                                </Panel>
                            </div>
                        </div>

                    </div>
            }
        </>
    )
}

export default Dashboard