import axios from 'axios';
import { Divider } from 'primereact/divider';
import { Image } from 'primereact/image';
import { Skeleton } from 'primereact/skeleton';
import React, { useEffect, useState } from 'react'
import { TabView, TabPanel } from 'primereact/tabview';
import { GoogleMap, useJsApiLoader, Marker, InfoWindow, Data } from '@react-google-maps/api';
import { InputText } from 'primereact/inputtext';
import { Button } from 'primereact/button';
import { InputNumber } from 'primereact/inputnumber';
 


function DetailsProduct({ data }) {

    const [loading, setLoading] = useState(true)
    const [product, setProduct] = useState([]);
    const [activeIndex, setActiveIndex] = useState(0);
    const [quantity, setQuantity] = useState([]);
    

    useEffect(() => {
        axios.get(`/api/Details/${data}`).then(res => {
            if (res.data.status === 200) {
                setProduct(res.data.results);
            }
            setLoading(false);
        }).catch((error) => {
            if (error.response.status === 500) {

            }
        })
    }, []);

    const containerStyle = {
        width: '100%',
        height: '300px',
    };

    const butuan = {
        lat: 8.9475,
        lng: 125.5406,

    }
    const { isLoaded } = useJsApiLoader({
        googleMapsApiKey: "AIzaSyBYboX0tQrX5nexk94H30QwGUgbXCTokJw",
    })

    // console.log(quantity);


    return (
        <div className='container'>
            {
                loading ? <Skeleton className='w-100' borderRadius='20px' />
                    :
                    <>
                        <Image src={`http://127.0.0.1:8000/${product.image}`} preview className="clippath" alt="Image" width='100%' height='100%' />
                        <Divider>
                            <span className='p-tag'>Details</span>
                        </Divider>
                        <ul className="list-group">
                            <li className="list-group-item border-0 d-flex justify-content-between align-items-center">
                                Price
                                <span className="">₱{product.price}</span>
                            </li>
                            <li className="list-group-item d-flex border-0 justify-content-between align-items-center">
                                Per Unit
                                <span className="">{product.quantity_product === 1 ? "Per Kilo" : "Per Pieces"}</span>
                            </li>
                            <li className="list-group-item border-0 d-flex justify-content-between align-items-center">
                                Barangay
                                <span className="">{product.brgy_name}</span>
                            </li>
                            <li className="list-group-item d-flex border-0 justify-content-between align-items-center">
                                Home Address
                                <span className="">{product.home_address}</span>
                            </li>
                        </ul>
                        <div className="mt-3">
                            <TabView activeIndex={activeIndex} onTabChange={(e) => setActiveIndex(e.index)}>
                                <TabPanel header="Description">
                                    <p className='text-secondary'>{product.description}</p>
                                </TabPanel>
                                <TabPanel header="Location">
                                    <GoogleMap
                                        mapContainerStyle={containerStyle}
                                        center={butuan}
                                        zoom={12}
                                        streetView={true}
                                        mapTypeId="satellite"
                                    >
                                        <Marker position={{ lat: product.lat, lng: product.lng }} animation={window.google.maps.Animation.DROP} icon={`https://chart.googleapis.com/chart?chst=d_map_pin_letter&chld=` + `${product.brgy_name}` + '|' + `${product.marker_color}` + '|000000'}>

                                        </Marker>

                                    </GoogleMap>
                                </TabPanel>
                                <TabPanel header="Contact">
                                    <ul className="list-group">
                                        <li className="list-group-item border-0 d-flex justify-content-between align-items-center">
                                            Contact Number
                                            <span className="">{product.contact_number}</span>
                                        </li>
                                        <li className="list-group-item d-flex border-0 justify-content-between align-items-center">
                                            Email Address
                                            <span className="">{product.email}</span>
                                        </li>
                                    </ul>
                                </TabPanel>
                            </TabView>
                        </div>
                        <div className="mt-3">
                            <div className="mb-3">
                                {
                                    product.quantity_product === 1 ?   <InputText placeholder='Quantity of Sacks' /> :  
                                    <>
                                        <label htmlFor="" className="form-label">
                                            Number of Quantity
                                        </label>
                                    <InputNumber value={quantity} onValueChange={(e) => setQuantity(e.value)} placeholder='Number of Pieces' className='w-100' />
                                    
                                    </>
                                    // <InputNumber value={quantity} onValueChange={(e) => setQuantity(e.value)} placeholder='Number of Pieces' className='w-100' />
                                     
                                }
                            </div>
                            <div className="p-inputgroup">

                                <InputText placeholder="00.00" className='w-100' value={(quantity * product.price).toFixed(2)} />
                                <Button className="p-button-primary p-button-sm" label='Place Bid' />
                            </div>
                        </div>

                    </>
            }
        </div>
    )
}

export default DetailsProduct